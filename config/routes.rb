Rails.application.routes.draw do


  get 'myaddress/index'
  resources :addresses
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'seller_console/index'
  get 'home/index'
  resources :ordereds
  devise_for :users
  resources :products
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
