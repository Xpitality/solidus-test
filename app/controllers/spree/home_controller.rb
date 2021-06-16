# frozen_string_literal: true

require 'xpitality/core/search/base'

module Spree
  class HomeController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.home_products
      @title = 'La selezione più croccante di vini naturali'
    end
  end
end