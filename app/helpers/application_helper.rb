module ApplicationHelper

  def show_delivery_location_modal?
    # cookies.delete :hide_location_modal
    delivery_location = current_store.additional_store_settings.delivery_location.first
    delivery_location&.show_modal? && cookies[:hide_location_modal].nil?
  end

  def store_email
    current_store.additional_store_settings.store_email.first&.text_value
  end

  def store_phone
    current_store.additional_store_settings.store_phone.first&.text_value
  end

  def store_instagram
    current_store.additional_store_settings.store_instagram.first&.text_value
  end

  def store_facebook
    current_store.additional_store_settings.store_facebook.first&.text_value
  end

end
