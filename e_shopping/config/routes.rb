Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get "faq", to: 'home#faq'
  get "contact", to: 'home#contact_us'
  get "products", to: 'products#index'
  get "view_product/:id", to: 'products#view_product'
  get "list_products", to: 'products#list_products'
end
