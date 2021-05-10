Spree::Product.class_eval do

  class << self
    def new_products(taxon_new)
      taxon_new ||= Spree::Taxon.find_by_key(:new)
      self.products_for_taxon(taxon: taxon_new, limit: 4)
    end

    def producer_products(producer_taxon)
      self.products_for_taxon(taxon: producer_taxon)
    end

    def collection_products(collection_taxon)
      self.products_for_taxon(taxon: collection_taxon)
    end

    def products_for_taxon(taxon:, limit: nil, order: 'DESC')
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

  def producer
    self.taxons.where(taxonomy_id: Spree::Taxonomy.find_by_key(:producer).id).first
  end

  def grape_type_taxon_names
    self.taxons.where(taxonomy_id: Spree::Taxonomy.find_by_key(:grape_type).id).pluck(:name)
  end

  def tag(type:, key:)
    if type == :property
      p = self.product_properties.where(property_id: Spree::Property.find_by_key(key)).first&.value
      if key == :alcohol && p
        "#{p}%"
      else
        p
      end
    elsif type == :taxon
      taxon_by_key(key: key)&.name
    end
  end

  def taxon_by_key(key:)
    t = self.taxons.where(taxonomy_id: Spree::Taxonomy.find_by_key(key).id).first

    if t && Spree::Taxon.tree.values.flatten.include?(key)
      t = taxon_tree(taxon: t, key: key)
    end
    t
  end

  def taxon_tree(taxon:, key:)
    tree = []
    t = taxon

    taxonomy = nil
    Spree::Taxon.tree.each do |taxon_key, taxon_values|
      taxonomy ||= taxon_key if taxon_values.include?(key)
    end

    while t.name != Spree::Taxon.basic_taxons[taxonomy]
      tree << t
      t = t.parent
    end
    tree.reverse!
    tree[Spree::Taxon.tree[taxonomy].index(key)]
  end



end
