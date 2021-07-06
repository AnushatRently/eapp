Rails.application.routes.draw do


  devise_for :users
  resources :products
  resources :shops, only:[:index,:show]
  resources :order_items
  resources :orders
  root "shops#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
