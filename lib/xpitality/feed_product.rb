module Xpitality
  class FeedProduct < Spree::FeedProduct
    # def schema
    #   super.merge('g:brand' => 'Awesome Store Inc.')
    # end

    def price
      Spree::Money.new(product.price_for(current_pricing_options)).money.format(symbol: false, with_currency: true)
    end

    def current_pricing_options
      Spree::Config.pricing_options_class.new(currency: "EUR", country_iso: "IT")
    end
  end
end