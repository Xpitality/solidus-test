Spree::PaymentMethod::BogusCreditCard.create!(
    { name: "Credit Card", description: "Bogus payment gateway", active: true }
)
Spree::PaymentMethod::Check.create!(
    { name: "Check", description: "Pay by check.", active: true }
)
Spree::PaymentMethod::PayPal.create!(
    { name: "Paypal", description: "Pay with paypal.", active: true }
)
