module ApplicationHelper

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

  def max_product_quantity(variant)
    user = try_spree_current_user
    if user

    else
      variant.total_on_hand
    end
  end
end
