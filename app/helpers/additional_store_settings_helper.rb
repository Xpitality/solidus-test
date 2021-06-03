module AdditionalStoreSettingsHelper
  def store_email
    current_store.additional_store_settings.find_by_label(:store_email)&.text_value
  end

  def store_email2
    current_store.additional_store_settings.find_by_label(:store_email2)&.text_value
  end

  def store_phone
    current_store.additional_store_settings.find_by_label(:store_phone)&.text_value
  end

  def store_instagram
    current_store.additional_store_settings.find_by_label(:store_instagram)&.text_value
  end

  def store_facebook
    current_store.additional_store_settings.find_by_label(:store_facebook)&.text_value
  end

end