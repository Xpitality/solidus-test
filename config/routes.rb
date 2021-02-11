Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount SolidusPaypalCommercePlatform::Engine, at: '/solidus_paypal_commerce_platform'
  mount Spree::Core::Engine, at: '/'
  mount Alchemy::Engine => '/'
end
