Spree::Product.class_eval do

  def quantity_limit(store:)
    quantity_limit_parent_taxon = Spree::Taxon.quantity_limit_taxon(store)
    quantity_limit_taxon = self.product.taxons.where(parent_id: quantity_limit_parent_taxon.id).first
    quantity_limit_taxon ? quantity_limit_taxon.name.to_i : nil
  end

end
