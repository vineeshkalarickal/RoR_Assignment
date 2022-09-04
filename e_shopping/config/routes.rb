Rails.application.routes.draw do
  get 'line_items/index'
  get 'orders/index'
  # root
  root 'home#index'

  devise_for :users, controllers: {
    session: 'users/sessions',
    registrations: 'users/registrations'
  }

  #get
  get 'home/index'
  get 'faq', to: 'home#faq'
  get 'contact', to: 'home#contact_us'
  get 'profile', to: 'home#profile'

  get 'products', to: 'products#index'
  get 'view_product/:id', to: 'products#show'
  get 'list_products', to: 'products#list'
  get 'admin_view', to: 'products#admin_view'
  get 'new_product', to: 'products#new'
  get 'edit_product/:id', to: 'products#edit', as: 'edit_product'

  get 'addresses', to: 'addresses#index'
  get 'new_address', to: 'addresses#new'
  get 'edit_address/:id', to: 'addresses#edit', as: 'edit_address'

  get 'cart', to: 'cart#view_cart'
  get 'add_to_cart/:id', to: 'cart#create'
  # post
  post 'new_product', to: 'products#create'
  post 'new_address', to: 'addresses#create'
  post 'place_order', to: 'line_items#place_order'
  # delete
  delete 'delete_product/:id', to: 'products#destroy'
  delete 'delete_address/:id', to: 'addresses#destroy'
  delete 'delete_line_item/:id/:p_id/:u_id', to: 'line_items#destroy'
  # patch
  patch 'edit_product/:id', to: 'products#update'
  patch 'edit_address/:id', to: 'addresses#update'
end
