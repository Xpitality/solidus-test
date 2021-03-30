Spree::Product.class_eval do

  def quantity_limit(store:)
    quantity_limit_parent_taxon = Spree::Taxon.quantity_limit_taxon(store: store)
    quantity_limit_taxon = self.taxons.where(parent_id: quantity_limit_parent_taxon.id).first
    quantity_limit_taxon ? quantity_limit_taxon.name.to_i : nil
  end

  def self.new_products(store:)
    taxon_new = Spree::Taxon.new_product_taxon(store: store)

    if taxon_new
      Spree::Product.joins(:taxons).where(Spree::Taxon.table_name => { id: taxon_new.id }).available.order('created_at DESC').limit(4)
    else
      Spree::Product.where('0=1')
    end
  end

  def max_product_quantity(user:, store:)
    if quantity_limit(store: store)
      user_quantity = Spree::LineItem.where(order_id: user.orders.pluck(:id)).where(variant_id: self.id).sum(:quantity)
      quantity_limit(store: store) - user_quantity
    else
      total_on_hand
    end
  end

end
