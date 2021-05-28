require 'roo'

module Spree
  module Admin
    class DiagnosticsController < Spree::Admin::BaseController

      skip_forgery_protection only: [:products_import]

      def import_export
        if params[:product_import_id]
          @product_import = Xpitality::ProductImport.find(params[:product_import_id])
        end
      end

      def products_import
        if params[:file]
          product_importer = Xpitality::ProductBatchImporter.new(file: params[:file], stock_location_id: params['stock_location_id'])
          product_importer.import
          redirect_to import_export_admin_diagnostics_path(product_import_id: product_importer.pi_id), flash: product_importer.flash
        elsif params[:product_import_id]
          product_importer = Xpitality::ProductBatchImporter.new
          product_importer.import_data(params[:product_import_id])
          redirect_to import_export_admin_diagnostics_path(product_import_id: params[:product_import_id]), flash: product_importer.flash
        end
      end

    end
  end
end