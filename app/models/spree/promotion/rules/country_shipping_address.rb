module Spree
  class Promotion
    module Rules
      class CountryShippingAddress < Spree::PromotionRule

        has_many :promotion_rule_shipping_countries, class_name: "Spree::PromotionRuleShippingCountry",
                 foreign_key: :promotion_rule_id,
                 dependent: :destroy
        has_many :countries, through: :promotion_rule_shipping_countries, class_name: "Spree::Country"

        def applicable?(promotable)
          promotable.is_a?(Spree::Order)
        end

        def eligible?(order, options = {})
          unless countries.any? { |country| order.ship_address&.country && order.ship_address.country.id == country.id }
            eligibility_errors.add(:base, eligibility_error_message(:no_matching_shipping_countries))
          end

          eligibility_errors.empty?
        end

        # def actionable?(line_item)
        #
        # end
      end
    end
  end
end