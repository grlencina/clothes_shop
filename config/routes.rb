Rails.application.routes.draw do
=begin
  get 'orders/add/:id', to: 'orders#add', as:'orders_add'
  get 'orders/show'
  get 'orders/index'
  get 'purchases/add/:id', to: 'purchases#add', as:'purchases_add'
  get 'purchases', to: 'purchases#index', as:'purchases_index'
  post 'purchases/add', to:'purchases#add_to_cart', as:'orders'
  get 'purchases/:id', to: 'purchases#show', as: 'purchase'
  get 'purchases/:id/edit', to: 'purchases#edit', as: 'purchase_edit'
  patch 'purchases/:id', to: 'purchases#update', as: 'purchase_update'
  get 'purchases/:id/submit', to:'purchases#submit', as:'purchase_submit'
  get 'purchases/:id/close', to:'purchases#close', as:'purchase_close'
  get 'purchases/:id/cancel', to:'purchases#cancel', as:'purchase_cancel'
  get 'purchases/:id/delete', to:'purchases#delete', as:'purchase_delete'
=end
    
  devise_for :users

  resources :items
  resources :orders, only: [ :show, :index]
  resources :orders, path: "orders/:id/", only: [ :new ]
  resources :purchases, except: [ :new ] do
    member do
      get :submit
      get :close
      get :cancel
      get :reject
    end  
  end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
end