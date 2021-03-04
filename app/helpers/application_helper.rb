module ApplicationHelper

  def show_delivery_location_modal?
    @store = Spree::Store.first
    delivery_location = @store.additional_store_settings.delivery_location.first
    delivery_location&.show_modal? && cookies[:hide_location_modal].nil?
  end

end
