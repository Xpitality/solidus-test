module ApplicationHelper
  def max_variant_quantity(variant)
    variant.max_product_quantity(user: try_spree_current_user, store: current_store)
  end
  def max_product_quantity(product)
    product.max_product_quantity(user: try_spree_current_user, store: current_store)
  end

end
