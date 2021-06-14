# frozen_string_literal: true

require 'xpitality/core/search/base'

module Spree
  class ProductsController < Spree::StoreController
    before_action :load_taxon, only: [:index, :filter]
    skip_forgery_protection only: :filter

    helper 'spree/taxons', 'spree/taxon_filters'

    respond_to :html

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)
      @title = 'Catalogo'
    end

    def filter
      @searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)

      respond_to do |format|
        format.js
      end
    end

    def show
      load_product
      @variants = @product.
        variants_including_master.
        display_includes.
        with_prices(current_pricing_options).
        includes([:option_values, :images])

      @product_properties = @product.product_properties.includes(:property)
      @taxon = Spree::Taxon.find(params[:taxon_id]) if params[:taxon_id]
    rescue ActiveRecord::RecordNotFound
      redirect_to products_path, flash: { error: I18n.t('store.errors.product_not_found') }
    end

    private

    def accurate_title
      if @product
        @product.meta_title.blank? ? @product.name : @product.meta_title
      else
        super
      end
    end

    def load_product
      if try_spree_current_user.try(:has_spree_role?, "admin")
        @products = Spree::Product.with_discarded
      else
        @products = Spree::Product.available
      end
      @product = @products.friendly.find(params[:id])
    end

    def load_taxon
      @selected_taxons = {}
      [:wine_type, :country, :producer, :grape_type, :format, :region].each do |taxonomy_key|
        localized_taxonomy_key = I18n.t("store.taxonomy_key.#{taxonomy_key}")
        if params[localized_taxonomy_key]
          @selected_taxons[taxonomy_key] ||= []
          params[localized_taxonomy_key].each do |taxon_name|
            t = Spree::Taxon.where(name: taxon_name).first
            if t
              @selected_taxons[taxonomy_key] << t
            end
          end
        end
      end
      if params[:taxon].present?
        @taxon = Spree::Taxon.find(params[:taxon])
        @selected_taxons[@taxon.taxonomy.taxonomy_key] ||= []
        @selected_taxons[@taxon.taxonomy.taxonomy_key] << @taxon
      else
        @taxon = nil
      end
    end
  end
end
