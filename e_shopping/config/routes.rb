Rails.application.routes.draw do
  devise_for :users, controllers: {
    session: 'users/sessions',
    registrations: 'users/registrations'
  }
  # root
  root "home#index"

  #get
  get 'home/index'
  get "faq", to: 'home#faq'
  get "contact", to: 'home#contact_us'
  get "products", to: 'products#index'
  get "view_product/:id", to: 'products#show'
  get "list_products", to: 'products#list'
  get 'admin_view', to: 'products#admin_view'

  # add edit forms
  get "new_product", to: 'products#new'
  get 'edit_product/:id', to: 'products#edit', as: 'edit_product'

  # post
  post 'new_product', to: 'products#create'

  # delete
  delete 'delete_product/:id', to: 'products#destroy'

  # patch
  patch 'edit_product/:id', to: 'products#update'

end
