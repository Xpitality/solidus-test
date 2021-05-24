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

        def new_products(taxon_new = nil)
          Spree::Product.new_products(taxon_new).descend_by_updated_at
        end

        def producer_products(producer_taxon)
          Spree::Product.producer_products(producer_taxon).descend_by_updated_at
        end

        def collection_products(collection_taxon)
          Spree::Product.collection_products(collection_taxon).descend_by_updated_at
        end

        def featured_collection_products
          Spree::Product.featured_collection_products.descend_by_updated_at
        end

        protected

        def get_base_scope
          base_scope = Spree::Product.display_includes.available
          if @properties[:taxons]
            product_ids = nil
            @properties[:taxons].map do |taxonomy_key, taxons|
              temp_product_ids = []
              temp_products = base_scope
              taxons.each { |t| temp_product_ids += temp_products.in_taxons(t).pluck(:id) }
              temp_product_ids.uniq!
              puts "#{taxonomy_key}: #{temp_product_ids}", ' '
              product_ids ||= temp_product_ids
              product_ids = product_ids & temp_product_ids
            end

            base_scope = Spree::Product.where(id: product_ids.to_a).display_includes.available
          else
            if @properties[:taxon]
              if @properties[:taxon].name == I18n.t("store.taxonomy_key.country")
                base_scope = base_scope.in_taxons(@properties[:taxon]) unless @properties[:taxon].blank?
              else
                base_scope = base_scope.in_taxon(@properties[:taxon]) unless @properties[:taxon].blank?
              end
            end

            # case @properties[:price]
            #   when 'order_asc'
            #     base_scope = base_scope.ascend_by_master_price
            #   when 'order_desc'
            #     base_scope = base_scope.descend_by_master_price
            #   when /^gte_(\d+\.?\d*)$/
            #     base_scope = base_scope.master_price_gte($1).ascend_by_master_price
            #   when /^lte_(\d+\.?\d*)$/
            #     base_scope = base_scope.master_price_lte($1).descend_by_master_price
            #   when /^between_(\d+\.?\d*)-(\d+\.?\d*)$/
            #     base_scope = base_scope.price_between($1, $2).ascend_by_master_price
            #   else
            #     if @properties[:price_lte]
            #       base_scope = base_scope.master_price_lte(@properties[:price_lte]).descend_by_master_price
            #     else
            #       base_scope = base_scope.descend_by_updated_at
            #     end
            # end
          end
          base_scope = get_products_conditions_for(base_scope, @properties[:keywords])
          base_scope = add_search_scopes(base_scope)
          base_scope = add_eagerload_scopes(base_scope)
          if @properties[:price_lte]
            base_scope = base_scope.master_price_lte(@properties[:price_lte]).descend_by_master_price
          else
            base_scope = base_scope.descend_by_updated_at
          end
          base_scope
        end

        def prepare(params)
          prepare_taxon_properties(params)
          @properties[:keywords] = params[:keywords]
          @properties[:search] = params[:search]
          @properties[:price] = params[:price]
          @properties[:price_lte] = params[:price_lte]
          @properties[:include_images] = params[:include_images]

          per_page = params[:per_page].to_i
          @properties[:per_page] = per_page > 0 ? per_page : Spree::Config[:products_per_page]
          @properties[:page] = (params[:page].to_i <= 0) ? 1 : params[:page].to_i
        end

        def prepare_taxon_properties(params)
          @properties[:taxon] = params[:taxon].blank? ? nil : taxon = Spree::Taxon.find(params[:taxon])
          taxons = {}

          I18n.t('store.taxonomy_key').each do |taxonomy_key, localized_taxonomy_key|
            if params[localized_taxonomy_key]
              taxons[taxonomy_key] = params[localized_taxonomy_key].map { |name| Spree::Taxon.where(name: name).first }.compact
            end
            if taxon && taxon.parent.name == localized_taxonomy_key && !taxons[taxonomy_key].to_a.include?(taxon)
              taxons[taxonomy_key] ||= []
              taxons[taxonomy_key] << taxon
            end
          end
          if taxons['region'] && taxons['country']
            taxons['region'].each { |t| taxons['country'] == taxons['country'] - [t.parent] }
            taxons['country_or_region'] = taxons['country'] + taxons['region']
            taxons.except! "country", "region"
          end
          if taxons.empty?
            @properties[:taxons] = nil
          else
            @properties[:taxons] = taxons
          end
        end
      end
    end
  end
end
