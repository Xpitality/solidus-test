Spree::Property.class_eval do
  BASIC_PROPERTIES = {
      occasion: 'Occasione',
      alcohol: 'Alcool',
      vintage: 'Annata'
  }

  class << self
    def find_by_key(key)
      Spree::Property.find_by_name(BASIC_PROPERTIES[key])
    end
  end
end
