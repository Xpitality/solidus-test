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
            @properties[:taxons].each do |taxon|
              if taxon.name == I18n.t("store.taxonomy_key.country")
                pids = Spree::Product.in_taxons(taxon).pluck(:id)
              else
                pids = Spree::Product.in_taxon(taxon).pluck(:id)
              end
              product_ids = pids if product_ids.nil?
              product_ids = product_ids & pids
            end
            base_scope = base_scope.where(id: product_ids)
          elsif @properties[:taxon]
            if @properties[:taxon].name == I18n.t("store.taxonomy_key.country")
              base_scope = base_scope.in_taxons(@properties[:taxon]) unless @properties[:taxon].blank?
            else
              base_scope = base_scope.in_taxon(@properties[:taxon]) unless @properties[:taxon].blank?
            end
          end
          base_scope = get_products_conditions_for(base_scope, @properties[:keywords])
          base_scope = add_search_scopes(base_scope)
          base_scope = add_eagerload_scopes(base_scope)
          case @properties[:price]
            when 'order_asc'
              base_scope = base_scope.ascend_by_master_price
            when 'order_desc'
              base_scope = base_scope.descend_by_master_price
            when /^gte_(\d+\.?\d*)$/
              base_scope = base_scope.master_price_gte($1).ascend_by_master_price
            when /^lte_(\d+\.?\d*)$/
              base_scope = base_scope.master_price_lte($1).descend_by_master_price
            when /^between_(\d+\.?\d*)-(\d+\.?\d*)$/
              base_scope = base_scope.price_between($1, $2).ascend_by_master_price
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
          @properties[:include_images] = params[:include_images]

          per_page = params[:per_page].to_i
          @properties[:per_page] = per_page > 0 ? per_page : Spree::Config[:products_per_page]
          @properties[:page] = (params[:page].to_i <= 0) ? 1 : params[:page].to_i
        end

        def prepare_taxon_properties(params)
          @properties[:taxon] = params[:taxon].blank? ? nil : taxon = Spree::Taxon.find(params[:taxon])
          taxons = []
          taxons << taxon if defined?(taxon) && taxon

          taxonomy_keys = I18n.t('store.taxonomy_key').values.reject{|k| k == I18n.t('store.taxonomy_key.country') && params[I18n.t('store.taxonomy_key.region')] }

          taxonomy_keys.each do |localized_taxonomy_key|
            if params[localized_taxonomy_key]
              t = Spree::Taxon.where(name: params[localized_taxonomy_key]).first
              taxons << t if t
            end
          end
          if (taxons.count <=1 && @properties[:taxon]) || taxons.empty?
            @properties[:taxons] = nil
          else
            @properties[:taxons] = taxons
          end
        end
      end
    end
  end
end
