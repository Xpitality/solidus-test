module ApplicationHelper

  def store_email
    current_store.additional_store_settings.store_email.first&.text_value
  end

  def store_phone
    current_store.additional_store_settings.store_phone.first&.text_value
  end

  def store_instagram
    current_store.additional_store_settings.store_instagram.first&.text_value
  end

  def store_facebook
    current_store.additional_store_settings.store_facebook.first&.text_value
  end

  def max_variant_quantity(variant)
    variant.max_product_quantity(user: try_spree_current_user, store: current_store)
  end
  def max_product_quantity(product)
    product.max_product_quantity(user: try_spree_current_user, store: current_store)
  end

  def taxon_by_key(key)
    Spree::Taxon.find_by_key(key)
  end

  def taxon_children(parent_key)
    Spree::Taxon.by_parent_key(parent_key)
  end

  def new_products_taxon
    Spree::Taxon.find_by_key(:new)
  end

  def conditionally_active_for(target_path)
    current_page?(target_path) ? 'active' : ''
  end
end
