module Spree
  module Admin
    class AdditionalStoreSettingsController < ResourceController

      def index
        @store = Spree::Store.find params['store_id']
        @store_email = @store.additional_store_settings.find_by_label(:store_email) || @store.additional_store_settings.new(label: :store_email)
        @store_email2 = @store.additional_store_settings.find_by_label(:store_email2) || @store.additional_store_settings.new(label: :store_email2)
        @store_phone = @store.additional_store_settings.find_by_label(:store_phone) || @store.additional_store_settings.new(label: :store_phone)
        @store_instagram = @store.additional_store_settings.find_by_label(:store_instagram) || @store.additional_store_settings.new(label: :store_instagram)
        @store_facebook = @store.additional_store_settings.find_by_label(:store_facebook) || @store.additional_store_settings.new(label: :store_facebook)
        @quantity_limit_taxonomy = @store.additional_store_settings.find_by_label(:quantity_limit_taxonomy) || @store.additional_store_settings.new(label: :quantity_limit_taxonomy)
        @featured_producer_taxon_name = @store.additional_store_settings.find_by_label(:featured_producer_taxon_name) || @store.additional_store_settings.new(label: :featured_producer_taxon_name)
        @featured_collection_taxon_name = @store.additional_store_settings.find_by_label(:featured_collection_taxon_name) || @store.additional_store_settings.new(label: :featured_collection_taxon_name)
      end

      def create
        @object.store_id = params['store_id']
        super
      end

      private

      def location_after_save
        admin_store_additional_store_settings_path(store_id: params['store_id'])
      end

    end
  end
end