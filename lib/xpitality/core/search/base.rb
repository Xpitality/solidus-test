# frozen_string_literal: true

require 'spree/deprecation'

module Xpitality
  module Core
    module Search
      class Base < ::Spree::Core::Search::Base
        # def retrieve_products
        #   @products = get_base_scope
        #   curr_page = @properties[:page] || 1
        #
        #   unless Spree::Config.show_products_without_price
        #     @products = @products.joins(:prices).merge(Spree::Price.where(pricing_options.search_arguments)).distinct
        #   end
        #   @products = @products.page(curr_page).per(@properties[:per_page])
        # end

        def new_products(taxon_new=nil)
          Spree::Product.new_products(taxon_new)
        end

        def producer_products(producer_taxon)
          Spree::Product.producer_products(producer_taxon)
        end

        def collection_products(collection_taxon)
          Spree::Product.collection_products(collection_taxon)
        end

        def featured_collection_products
          Spree::Product.featured_collection_products
        end

        def milano_products
          Spree::Product.milano_products
        end

      end
    end
  end
end
