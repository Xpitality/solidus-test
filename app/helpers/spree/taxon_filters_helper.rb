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
      # if excluded
      #   return products_path if selected_taxons.blank?
      #
      #   selected_taxons = selected_taxons.select { |key, value| value.id != excluded.id }
      #   return products_path if selected_taxons.blank?
      #
      #   key = selected_taxons.keys.first
      #   taxon = selected_taxons[key]
      #   selected_taxons = selected_taxons.select { |k, value| k != key }
      # end
      #
      #
      # url = spree.nested_taxons_path(taxon.permalink)
      # url_vars = []
      # unless selected_taxons.blank?
      #   selected_taxons.each do |taxonomy_key, selected_taxon|
      #     unless taxonomy_key == taxon.taxonomy.taxonomy_key
      #       url_vars << "#{I18n.t("store.taxonomy_key.#{taxonomy_key}")}=#{selected_taxon.name}"
      #     end
      #   end
      # end
      # if url_vars.blank?
      #   url
      # else
      #   "#{url}?#{url_vars.join('&')}"
      # end
      ''
    end
  end
end
