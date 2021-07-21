Rails.application.routes.draw do



  get 'myreview/index'
  get 'myreview/show'
  resources :reviews
  use_doorkeeper
  resources :myaddress,only:[:index,:show]
  resources :addresses
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'seller_console/index'
  get 'home/index'
  get '/api/v1/order_items' => 'api/v1/order_items#all_order_items'
   get '/api/v1/users/:id/order_items' => 'api/v1/order_items#index',as: "user_order_items"
  resources :ordereds
  devise_for :users
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
