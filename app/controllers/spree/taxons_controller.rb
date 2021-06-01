# frozen_string_literal: true

require 'xpitality/core/search/base'

module Spree
  class TaxonsController < Spree::StoreController
    helper 'spree/products', 'spree/taxon_filters'

    before_action :load_taxon, only: [:show]

    respond_to :html

    def show
      @searcher = build_searcher(params.merge(taxon: @taxon.id, include_images: true))
      @products = @searcher.retrieve_products
      @taxonomies = Spree::Taxonomy.includes(root: :children)
      if @selected_taxons.values.flatten.count == 1
        @title = @taxon.name
      else
        @title = "Catalogo"
      end
    end

    private

    def load_taxon
      @taxon = Spree::Taxon.find_by!(permalink: params[:id])

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
      @selected_taxons[@taxon.taxonomy.taxonomy_key] ||= []
      @selected_taxons[@taxon.taxonomy.taxonomy_key] << @taxon
    end

    def accurate_title
      if @taxon
        @taxon.seo_title
      else
        super
      end
    end
  end
end
