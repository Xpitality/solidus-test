module Spree
  class Promotion
    module Rules
      class ItalianShippingAddress < Spree::PromotionRule
        def applicable?(promotable)
          # promotable.ship_address&.country && promotable.ship_address.country.iso == 'IT'
          promotable.is_a?(Spree::Order)
        end

        def eligible?(order, options = {})
          order.ship_address&.country && order.ship_address.country.iso == 'IT'
        end

        # def actionable?(line_item)
        #
        # end
      end
    end
  end
end