# frozen_string_literal: true

module Spree
  class Variant < Spree::Base
    class CustomVatPriceGenerator < VatPriceGenerator

      def run
        # Early return if there is no VAT rates in the current store.
        return if !variant.tax_category || variant_vat_rates.empty?

        country_isos_requiring_price.each do |country_iso|
          # Don't re-create the default price
          next if variant.default_price && variant.default_price.country_iso == country_iso

          foreign_price = find_or_initialize_price_by(country_iso, variant.default_price.currency)

          amount = variant.default_price.net_amount * (1 + vat_for_country_iso(country_iso))
          decimal_part = amount - amount.to_i
          if decimal_part >= 0.95
            amount = amount + 1.0 - decimal_part
          elsif decimal_part <= 0.05
            amount -= decimal_part
          end

          foreign_price.amount = amount
        end
      end
    end
  end
end
