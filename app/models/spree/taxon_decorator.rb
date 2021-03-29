Spree::Taxon.class_eval do
  def self.quantity_limit_taxon(store:)
    quantity_limit_taxonomy = store.additional_store_settings.quantity_limit_taxonomy.first&.text_value
    Spree::Taxon.find_by(name: quantity_limit_taxonomy)
  end

  def self.new_product_taxon(store:)
    new_product_taxon_name = store.additional_store_settings.new_product_taxon_name.first&.text_value
    Spree::Taxon.where(name: new_product_taxon_name).first
  end

end
