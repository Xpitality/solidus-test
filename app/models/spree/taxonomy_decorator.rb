Spree::Taxonomy.class_eval do
  BASIC_TAXONOMIES = {
      wine_type: 'Tipologia',
      grape_type: 'Uve',
      country: 'Paese',
      format: 'Formato'
  }

  class << self
    def find_by_key(key)
      Spree::Taxonomy.find_by_name(BASIC_TAXONOMIES[key]) || Spree::Taxonomy.find_by_name(BASIC_TAXONOMIES[taxonomy_key_for_taxon_key(key)])
    end

    def taxonomy_key_for_taxon_key(key)
      taxonomy_key = nil
      Spree::Taxon.tree.each do |taxon_key, taxon_values|
        taxonomy_key ||= taxon_key if taxon_values.include?(key)
      end
      taxonomy_key
    end
  end
end
