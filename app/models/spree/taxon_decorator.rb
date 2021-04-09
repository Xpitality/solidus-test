Spree::Taxon.class_eval do
  BASIC_TAXONS = {
      tipologia: 'Tipologia',
      country: 'Paese',
      producers: 'Produttore',
      new: 'Novità'
  }

  class << self
    def find_by_key(key)
      Spree::Taxon.find_by_name(BASIC_TAXONS[key])
    end

    def quantity_limit_taxon(store:)
      quantity_limit_taxonomy = store.additional_store_settings.quantity_limit_taxonomy.first&.text_value
      Spree::Taxon.find_by_name(quantity_limit_taxonomy)
    end

    def new_product_taxon(store:)
      new_product_taxon_name = store.additional_store_settings.new_product_taxon_name.first&.text_value
      Spree::Taxon.find_by_name(new_product_taxon_name)
    end

    def by_parent_key(key)
      if BASIC_TAXONS[key]
        t = Spree::Taxon.find_by_key(key)
        Spree::Taxon.where(parent_id: t.id)
      else
        Spree::Taxon.none
      end
    end
  end



end
