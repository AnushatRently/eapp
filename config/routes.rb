Rails.application.routes.draw do



  resources :likes
  get 'myreview/index'
  get 'myreview/show'
  resources :reviews
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  resources :myaddress,only:[:index,:show]
  resources :addresses
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'seller_console/index'
  get 'home/index'
  get '/api/v1/order_items' => 'api/v1/order_items#all_order_items'
  get '/api/v1/users/:id/order_items' => 'api/v1/order_items#index',as: "user_order_items"
  get 'api/v1/payment_details' => 'api/v1/payment_details#all_payment_details'
  get '/api/v1/users/:id/payment_details' => 'api/v1/payment_details#index',as: "user_payment_details"
  get '/api/v1/users/:id/liked_products' => 'api/v1/likes#liked_products',as: "user_liked_products"
  get '/api/v1/products/:id/liked_users' => 'api/v1/likes#liked_users',as: "product_liked_users"
  get '/api/v1/products' => 'api/v1/products#all_products'
  get '/api/v1/users/:id/products' => 'api/v1/products#index',as: "user_products"
  resources :ordereds
  devise_for :users, controllers: { liked_users: 'liked_users' }
  resources :products do
    collection {post:import}
  end
  resources :shops, only:[:index,:show]
  resources :order_items
  resources :orders
  resources :myorders, only:[:index]


  namespace :api do
    namespace :v1 do
      resources :users
      resources :products
      resources :order_items
      resources :ordereds
    end
  end

  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
