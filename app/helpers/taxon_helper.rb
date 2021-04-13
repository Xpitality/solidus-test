module TaxonHelper
  def taxon_by_key(key)
    Spree::Taxon.find_by_key(key)
  end

  def taxon_children(parent_key)
    Spree::Taxon.by_parent_key(parent_key)
  end

  def featured_producer_taxon
    Spree::Taxon.featured_producer_taxon(store: current_store)
  end

  def featured_collection_taxon
    Spree::Taxon.featured_collection_taxon(store: current_store)
  end

end