# frozen_string_literal: true

class CreatePromotionRuleShippingCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :promotion_rules_shipping_countries do |t|
      t.references :country, null: false
      t.references :promotion_rule, null: false

      t.timestamps
    end
  end
end
