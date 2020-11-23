Rails.application.routes.draw do
mount SolidusPaypalCommercePlatform::Engine, at: '/solidus_paypal_commerce_platform'
  mount Spree::Core::Engine, at: '/'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
