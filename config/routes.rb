Rails.application.routes.draw do
  get 'purchases/add/:id', to: 'purchases#add', as:'purchases_add'
  post 'purchases/orders', to:'purchases#add_to_cart', as:'orders'
  get 'purchases', to: 'purchases#index', as:'purchases_index'
  get 'purchase/:id', to: 'purchases#show', as: 'purchase'
  devise_for :users
  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
end