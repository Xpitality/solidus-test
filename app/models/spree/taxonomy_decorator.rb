Spree::Taxonomy.class_eval do
  BASIC_TAXONOMIES = {
      wine_type: 'Tipologia'
  }

  class << self
    def find_by_key(key)
      Spree::Taxonomy.find_by_name(BASIC_TAXONOMIES[key])
    end
  end
end
