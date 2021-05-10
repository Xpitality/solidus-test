Spree::Taxon.class_eval do
  BASIC_TAXONS = {
      wine_type: 'Tipologia',
      country: 'Paese',
      producer: 'Produttore',
      new: 'Novità',
      collection: 'Collezioni',
      grape_type: 'Uve',
      format: 'Formato'
  }

  TREE = {
      country: [:country, :region, :zone]
  }

  class << self
    def find_by_key(key)
      Spree::Taxon.find_by_name(BASIC_TAXONS[key])
    end

    def quantity_limit_taxon(store:)
      quantity_limit_taxonomy = store.additional_store_settings.find_by_label(:quantity_limit_taxonomy)&.text_value
      Spree::Taxon.find_by_name(quantity_limit_taxonomy)
    end

    def featured_producer_taxon(store:)
      featured_producer_taxon_name = store.additional_store_settings.find_by_label(:featured_producer_taxon_name)&.text_value
      Spree::Taxon.where(name: featured_producer_taxon_name).first
    end

    def featured_collection_taxon(store:)
      featured_collection_taxon_name = store.additional_store_settings.find_by_label(:featured_collection_taxon_name)&.text_value
      Spree::Taxon.where(name: featured_collection_taxon_name).first
    end

    def by_parent_key(key)
      if BASIC_TAXONS[key]
        t = Spree::Taxon.find_by_key(key)
        Spree::Taxon.where(parent_id: t.id)
      else
        Spree::Taxon.none
      end
    end

    def tree
      TREE
    end

    def basic_taxons
      BASIC_TAXONS
    end
  end



end
