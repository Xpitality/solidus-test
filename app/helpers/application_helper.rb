module ApplicationHelper
  include Alchemy::ElementsHelper

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

  def link_to_cart_span(text = nil)
    text = text ? h(text) : t('spree.cart')
    css_class = nil

    if current_order.nil? || current_order.item_count.zero?
      text = "#{text}: (#{t('spree.empty')})"
      css_class = 'empty'
    else
      text = "#{text}: (#{current_order.item_count})  <span class='amount'>#{current_order.display_total.to_html}</span>"
      css_class = 'full'
    end

    link_to text.html_safe, '#', class: "cart-info #{css_class}"
  end
end
