Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :taxons, only: [] do
      resources :images do
        collection do
          post :update_positions
        end
      end
    end
    resources :stores do
      resources :additional_store_settings, only: [:create, :update, :index]
    end
  end

  namespace :api, defaults: { format: 'json' } do
    resources :taxons do
      resources :images
    end
  end
end

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount SolidusPaypalCommercePlatform::Engine, at: '/solidus_paypal_commerce_platform'
  mount Spree::Core::Engine, at: '/'
  mount Alchemy::Engine => '/'
end
