# frozen_string_literal: true

require 'xpitality/core/search/base'

module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)
      @title = 'Enoteca Naturale - La selezione più croccante di vini naturali'
    end
  end
end