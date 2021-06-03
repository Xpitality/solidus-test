# frozen_string_literal: true

module Spree
  class PromotionRuleShippingCountry < Spree::Base
    extend ActiveModel::Translation

    self.table_name = "promotion_rules_shipping_countries"

    belongs_to :promotion_rule, class_name: "Spree::PromotionRule", optional: true
    belongs_to :country, class_name: "Spree::Country", optional: true

  end
end
