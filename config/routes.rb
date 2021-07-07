Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'seller_console/index'
  get 'myorders/index'
  get 'home/index'
  resources :ordereds
  devise_for :users
  resources :products
  resources :shops, only:[:index,:show]
  resources :order_items
  resources :orders

  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
