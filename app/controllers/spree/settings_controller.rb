module Spree
  class SettingsController < Spree::StoreController
    respond_to :html
    skip_before_action :verify_authenticity_token

    def delivery_settings
      store = Spree::Store.first
      delivery_location = store.additional_store_settings.delivery_location.first
      if delivery_location&.show_modal?
        cookies[:hide_location_modal] = { value: "yes", expires: delivery_location.hours_until_delivery_location_expiry.hours }
      end

      redirect_to :root
    end
  end
end
