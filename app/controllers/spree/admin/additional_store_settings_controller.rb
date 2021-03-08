module Spree
  module Admin
    class AdditionalStoreSettingsController < ResourceController

      def index
        @store = Spree::Store.find params['store_id']
        @delivery_location = @store.additional_store_settings.where(label: :delivery_location).first || @store.additional_store_settings.new(label: :delivery_location)
        @store_email = @store.additional_store_settings.where(label: :store_email).first || @store.additional_store_settings.new(label: :store_email)
        @store_phone = @store.additional_store_settings.where(label: :store_phone).first || @store.additional_store_settings.new(label: :store_phone)
        @store_instagram = @store.additional_store_settings.where(label: :store_instagram).first || @store.additional_store_settings.new(label: :store_instagram)
        @store_facebook = @store.additional_store_settings.where(label: :store_facebook).first || @store.additional_store_settings.new(label: :store_facebook)
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