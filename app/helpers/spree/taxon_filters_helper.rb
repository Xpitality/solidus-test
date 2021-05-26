# frozen_string_literal: true

require 'spree/core/product_filters'

module Spree
  module TaxonFiltersHelper
    def applicable_filters_for(_taxon)
      [:brand_filter, :price_filter].map do |filter_name|
        Spree::Core::ProductFilters.send(filter_name) if Spree::Core::ProductFilters.respond_to?(filter_name)
      end.compact
    end

    def taxon_seo_url(taxon:, selected_taxons: nil, excluded: nil)
      url_vars = []

      unless selected_taxons.blank?
        selected_taxons.each do |taxonomy_key, selected_taxon_a|
          selected_taxon_a.each do |selected_taxon|
            if (taxon.nil? || taxonomy_key != taxon.taxonomy.taxonomy_key) && selected_taxon != excluded
              if taxon.nil?
                taxon = selected_taxon
              else
                url_vars << "#{I18n.t("store.taxonomy_key.#{taxonomy_key}")}[]=#{selected_taxon.name}"
              end
            end
          end
        end
      end

      if url_vars.blank?
        products_path
      else
        url = spree.nested_taxons_path(taxon.permalink)
        "#{url}?#{url_vars.join('&')}"
      end
    end
  end
end
