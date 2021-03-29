tax_category = Spree::TaxCategory.find_or_create_by!(name: "Default")
europe_vat = Spree::Zone.find_by!(name: "EU_VAT")
shipping_category = Spree::ShippingCategory.find_or_create_by!(name: 'Default')

Spree::ShippingMethod.create!([
                                  {
                                      name: "UPS Ground (EUR)",
                                      zones: [europe_vat],
                                      calculator: Spree::Calculator::Shipping::FlatRate.create!,
                                      tax_category: tax_category,
                                      shipping_categories: [shipping_category]
                                  }
                              ])

{
    "UPS Ground (EUR)" => [8, "EUR"]
}.each do |shipping_method_name, (price, currency)|
  shipping_method = Spree::ShippingMethod.find_by!(name: shipping_method_name)
  shipping_method.calculator.preferences = {
      amount: price,
      currency: currency
  }
  shipping_method.calculator.save!
  shipping_method.save!
end