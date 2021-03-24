Spree::Taxon.class_eval do
  has_many :images, -> { order(:position) }, as: :viewable, dependent: :destroy, class_name: "Spree::TaxonImage"

  # # Image that can be used for the variant.
  # #
  # # Will first search for images on the variant. If it doesn't find any,
  # # it'll fallback to any variant image (unless +fallback+ is +false+) or to
  # # a new {Spree::Image}.
  # # @param fallback [Boolean] whether or not we should fallback to an image
  # #   not from this variant
  # # @return [Spree::Image] the image to display
  # def display_image(fallback: true)
  #   Spree::Deprecation.warn('Spree::Variant#display_image is DEPRECATED. Choose an image from Spree::Variant#gallery instead')
  #   images.first || (fallback && product.variant_images.first) || Spree::Image.new
  # end

  # The gallery for the variant, which represents all the images
  # associated with it
  #
  # @return [Spree::Gallery] the media for a variant
  def gallery
    @gallery ||= Spree::Gallery::TaxonGallery.new(self)
  end

  def self.quantity_limit_taxon(store:)
    quantity_limit_taxonomy = store.additional_store_settings.quantity_limit_taxonomy.first&.text_value
    Spree::Taxon.find_by(name: quantity_limit_taxonomy)
  end

  def self.new_product_taxon(store:)
    new_product_taxon_name = store.additional_store_settings.new_product_taxon_name.first&.text_value
    Spree::Taxon.where(name: new_product_taxon_name).first
  end

end
