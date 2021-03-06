Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount SolidusPaypalCommercePlatform::Engine, at: '/solidus_paypal_commerce_platform'
  mount Spree::Core::Engine, at: '/'
  mount Alchemy::Engine => '/alchemy/'

  match '(*any)', to: redirect(subdomain: ''), via: :all, constraints: {subdomain: 'www'}
end

Spree::Core::Engine.routes.draw do
  resources :products, only: [] do
    resources :product_likes, only: [] do
      get :toggle, on: :collection
    end
  end


  namespace :admin do
    resources :diagnostics, only: [] do
      get :import_export, on: :collection
      get :temp_command, on: :collection
      post :products_import, on: :collection
    end
  end

  get '/p/:id', to: 'pages#show'

  match '/filter_products', to: 'products#filter', via: [:get, :post]

  resources :producers, only: :index

  resources :orders do
    get :plus, on: :collection
    get :minus, on: :collection
    get :remove, on: :collection
    get :refresh, on: :collection
  end
end

# Spree::Core::Engine.routes.draw do
#   root to: 'home#index'
#
#   resources :products, only: [:index, :show]
#
#   get '/locale/set', to: 'locale#set'
#   post '/locale/set', to: 'locale#set', as: :select_locale
#
#   # non-restful checkout stuff
#   patch '/checkout/update/:state', to: 'checkout#update', as: :update_checkout
#   get '/checkout/:state', to: 'checkout#edit', as: :checkout_state
#   get '/checkout', to: 'checkout#edit', as: :checkout
#
#   get '/orders/populate', to: 'orders#populate_redirect'
#   get '/orders/:id/token/:token' => 'orders#show', as: :token_order
#
#   resources :orders, except: [:index, :new, :create, :destroy] do
#     post :populate, on: :collection
#     resources :coupon_codes, only: :create
#   end
#
#   get '/cart', to: 'orders#edit', as: :cart
#   patch '/cart', to: 'orders#update', as: :update_cart
#   put '/cart/empty', to: 'orders#empty', as: :empty_cart
#
#   # route globbing for pretty nested taxon and product paths
#   get '/t/*id', to: 'taxons#show', as: :nested_taxons
#
#   get '/unauthorized', to: 'home#unauthorized', as: :unauthorized
#   get '/content/cvv', to: 'content#cvv', as: :cvv
#   get '/cart_link', to: 'store#cart_link', as: :cart_link
# end