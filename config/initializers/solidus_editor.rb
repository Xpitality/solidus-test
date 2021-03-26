Spree::Config[:show_raw_product_description] = true

SpreeEditor::Config.tap do |config|
  config.ids = 'product_description page_body taxon_description'

  config.enabled = true

  config.current_editor = 'CKEditor'
  # config.current_editor = 'TinyMCE'
end
