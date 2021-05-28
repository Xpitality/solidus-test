module Xpitality
  class ProductBatchImporter

    attr_accessor :file, :stock_location, :spreadsheet, :import_errors, :header, :dry_run, :status, :status_message, :pi_id

    def initialize(file: nil, stock_location_id: nil)
      @file = file
      @stock_location = Spree::StockLocation.find(stock_location_id) if stock_location_id
      @import_errors = {
          unknown_columns: [],
          unknown_skus: [],
          missing_stock_items: [],
          incorrect_quantity_value: [],
          duplicate_rows: []
      }
      @data = {}
    end

    def import_data(product_import_id)
      pi = Xpitality::ProductImport.where(id: product_import_id).first
      if pi
        if pi.completed
          @status_message = "This ProductImport was previously already completed."
          @status = :error
        else
          @data = pi.data
          @stock_location = pi.stock_location
          import_rows
          @status_message = "All valid rows imported."
          @status = :success
          pi.update_attribute(:completed, true)
        end
      else
        @status_message = "ProductImport not found for provided ID. Nothing was imported."
        @status = :error
      end
    end

    def import
      begin
        load_spreadsheet

        @dry_run = true

        if import_possible?
          load_data
          import_rows

          if no_errors?
            @dry_run = false
            import_rows

            @status_message = "All rows imported without any errors."
            @status = :success
            completed = true
          else
            @status_message = "There were some errors, they can be ignored and only valid rows imported."
            @status = :error
            completed = false
          end
        else
          @status_message = "Nothing was imported. "
          @status_message << "SKU was not recognized in any of the header cells. " unless @header[:sku]
          @status_message << "At least 2 columns need to be recognized in the header. Recognized columns: #{@header.values.compact.join(", ")}. " if @header[:sku].nil? && @header.values.compact.length < 1
          @status = :error
          completed = true
        end
        pi = Xpitality::ProductImport.create(status: @status, status_message: @status_message, import_errors: @import_errors, data: @data, completed: completed, stock_location_id: @stock_location.id)
        @pi_id = pi.id
      rescue RuntimeError => e
        @status = :error
        @status_message = "Issues with file, please upload xls or xlsx file"
      end
    end

    def flash
      if @status == :error
        { error: @status_message }
      else
        { notice: @status_message }
      end
    end

    private

    def load_spreadsheet
      file_ext = File.extname(@file.original_filename)
      raise "Unknown file type: #{@file.original_filename}" unless [".xls", ".xlsx"].include?(file_ext)
      @spreadsheet = (file_ext == ".xls") ? Roo::Excel.new(@file.path) : Roo::Excelx.new(@file.path)

      @header = {}
      @spreadsheet.row(1).each_with_index do |header_col, i|
        if header_col.downcase == 'sku'
          @header[:sku] = i
        elsif %(quantity qty quantità).include?(header_col.downcase)
          @header[:quantity] = i
        else
          @import_errors[:unknown_columns] << header_col
        end
      end
    end

    def load_data
      (2..@spreadsheet.last_row).each do |i|
        row = load_row(@spreadsheet.row(i))

        if @data[row[:sku]]
          @import_errors[:duplicate_rows] << row[:sku]
        else
          @data[row[:sku]] = row
        end
      end
    end

    def load_row(r)
      sku = r[@header[:sku]]
      unless sku.blank?
        valid = true

        product_variant = Spree::Variant.find_by_sku(sku)
        unless product_variant
          @import_errors[:unknown_skus] << sku
          valid = false
        end

        row = {
            sku: sku,
            valid: valid
        }

        if @header[:quantity]
          quantity = r[@header[:quantity]]
          if quantity.to_i.to_s != quantity.to_s
            @import_errors[:incorrect_quantity_value] << row[:sku]
            row[:valid] = false
          else
            row[:quantity] = quantity.to_i

            if @stock_location && product_variant
              stock_item = product_variant.product.stock_items.where(stock_location: @stock_location).first
              if stock_item
                row[:stock_item_id] = stock_item.id
              else
                @import_errors[:missing_stock_items] << sku
                row[:valid] = false
              end
            else
              row[:valid] = false
            end
          end
        end

        row
      end
    end

    def import_rows
      @data.values.each do |row|
        if row[:valid]
          update_quantity(row) if row[:quantity]
        end
      end
    end

    def no_errors?
      @import_errors.values.all? { |a| a.blank? }
    end

    def import_possible?
      @header[:sku] && @header.values.compact.length > 1
    end

    def update_quantity(row)
      stock_item = Spree::StockItem.find(row[:stock_item_id])
      @data[row[:sku]][:old_quantity] = stock_item.count_on_hand
      stock_item.set_count_on_hand(row[:quantity]) unless @dry_run
    end
  end
end
