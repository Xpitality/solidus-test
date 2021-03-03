module Spree
  module Admin
    class AdditionalStoreSettingsController < ResourceController

      def index
        @store = Spree::Store.find params['store_id']
        @delivery_location = @store.additional_store_settings.where(label: :delivery_location).first || @store.additional_store_settings.new(label: :delivery_location)
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