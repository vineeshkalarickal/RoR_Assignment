Rails.application.routes.draw do
  devise_for :users, controllers: {
    session: 'users/sessions',
    registrations: 'users/registrations'
  }

  root "home#index"

  get 'home/index'
  get "faq", to: 'home#faq'
  get "contact", to: 'home#contact_us'
  get "products", to: 'products#index'
  get "view_product/:id", to: 'products#show'
  get "list_products", to: 'products#list'
  get "new_product", to: 'products#new'
  get 'admin_view', to: 'products#admin_view'
  
  # post
  post 'new_product', to: 'products#create'
end
