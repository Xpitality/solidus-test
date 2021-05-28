class Xpitality::ProductImport < ActiveRecord::Base
  VALID_COLUMNS = %w(sku quantity)

  store :data
  store :import_errors

  belongs_to :stock_location, class_name: 'Spree::StockLocation'

  self.table_name_prefix = 'xpitality_'

  def headers
    self.data.values.first&.keys & VALID_COLUMNS
  end

  def row_issues(row)
    issues = []
    issues << "unknown SKU" if import_errors['unknown_skus'].include?(row['sku'])
    issues << "incorrect quantity value" if import_errors['incorrect_quantity_value'].include?(row['sku'])
    issues << "duplicated rows" if import_errors['duplicate_rows'].include?(row['sku'])
    issues << "missing stock item" if import_errors['missing_stock_items'].include?(row['sku'])
    issues.join(', ')
  end

  def file_issues
    issues = []
    issues << "unknown columns: #{import_errors['unknown_columns'].join(', ')}" unless import_errors['unknown_columns'].blank?
  end
end
