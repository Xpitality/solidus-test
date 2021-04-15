Spree::Variant.class_eval do

  def max_product_quantity(user:, store:)
    if quantity_limit(store: store)
      user_quantity = Spree::LineItem.where(order_id: user.orders.pluck(:id)).where(variant_id: self.id).sum(:quantity)
      quantity_limit(store: store) - user_quantity
    else
      total_on_hand
    end
  end

    private

    def quantity_limit(store:)
      @quantity_limit ||= self.product.quantity_limit(store: store)
    end
end