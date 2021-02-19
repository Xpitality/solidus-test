# frozen_string_literal: true

module Spree
  class TaxonImage < Asset
    if Rails.env.staging?
      include ::Spree::TaxonImage::ActiveStorageAttachment
    else
      include ::Spree::TaxonImage::PaperclipAttachment
    end

    # include ::Spree::Config.taxon_image_attachment_module

    def mini_url
      Spree::Deprecation.warn(
        'Spree::TaxonImage#mini_url is DEPRECATED. Use Spree::TaxonImage#url(:mini) instead.'
      )
      url(:mini)
    end
  end
end
