Spree::Taxonomy.class_eval do
  BASIC_TAXONOMIES = [:wine_type, :grape_type, :country, :format, :producer]

  class << self
    def find_by_key(key)
      Spree::Taxonomy.find_by_name(I18n.t("store.taxonomy_key.#{key}")) || Spree::Taxonomy.find_by_name(I18n.t("store.taxonomy_key.#{taxonomy_key_for_taxon_key(key)}"))
    end

    def taxonomy_key_for_taxon_key(key)
      taxonomy_key = nil
      Spree::Taxon.tree.each do |taxon_key, taxon_values|
        taxonomy_key ||= taxon_key if taxon_values.include?(key)
      end
      taxonomy_key
    end
  end

  def taxonomy_key
    BASIC_TAXONOMIES.select do |key|
      I18n.t("store.taxonomy_key.#{key}") == self.name
    end.first
  end
end
