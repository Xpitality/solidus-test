Spree::Product.class_eval do

  def quantity_limit(store:)
    quantity_limit_parent_taxon = Spree::Taxon.quantity_limit_taxon(store: store)
    quantity_limit_taxon = self.taxons.where(parent_id: quantity_limit_parent_taxon.id).first
    quantity_limit_taxon ? quantity_limit_taxon.name.to_i : nil
  end

  def max_product_quantity(user:, store:)
    if quantity_limit(store: store)
      user_quantity = Spree::LineItem.where(order_id: user.orders.pluck(:id)).where(variant_id: self.id).sum(:quantity)
      quantity_limit(store: store) - user_quantity
    else
      total_on_hand
    end
  end

  def self.new_products(taxon_new)
    taxon_new ||= Spree::Taxon.find_by_key(:new)
    self.products_for_taxon(taxon: taxon_new, limit: 4)
  end

  def self.producer_products(producer_taxon)
    self.products_for_taxon(taxon: producer_taxon)
  end

  def self.collection_products(collection_taxon)
    self.products_for_taxon(taxon: collection_taxon)
  end

  def wine_type_taxon
    self.taxons.where(taxonomy_id: Spree::Taxonomy.find_by_key(:wine_type))
  end

  private

  def self.products_for_taxon(taxon:, limit: nil, order: 'DESC')
    if taxon
      if limit
        Spree::Product.joins(:taxons).where(Spree::Taxon.table_name => { id: taxon.id }).available.order("created_at #{order}").limit(limit)
      else
        Spree::Product.joins(:taxons).where(Spree::Taxon.table_name => { id: taxon.id }).available.order("created_at #{order}")
      end
    else
      Spree::Product.where('0=1')
    end
  end

end
