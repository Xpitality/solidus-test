module ApplicationHelper
  def max_variant_quantity(variant)
    variant.max_product_quantity(user: try_spree_current_user, store: current_store)
  end
  def max_product_quantity(product)
    product.max_product_quantity(user: try_spree_current_user, store: current_store)
  end
  def conditionally_active_for(target_path)
    current_page?(target_path) ? 'active' : ''
  end

  def cache_key_for_home_products(section, record=nil)
    count = @products.count
    max_updated_at = (@products.maximum(:updated_at) || Date.today).to_s(:number)
    "#{section}/#{record}/#{I18n.locale}/#{current_pricing_options.cache_key}/spree/products/all-#{params[:page]}-#{max_updated_at}-#{count}"
  end
end
