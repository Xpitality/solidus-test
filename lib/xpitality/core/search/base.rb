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

        def new_products
          taxon_new = Spree::Taxon.where(name: 'Novità').first
          if taxon_new
            Spree::Product.joins(:taxons).where(Spree::Taxon.table_name => { id: taxon_new.id }).available.order('created_at DESC').limit(4)
          else
            Spree::Product.where('0=1')
          end
        end

      end
    end
  end
end
