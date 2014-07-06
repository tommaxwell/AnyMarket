Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  
  #users
  get "/users/:id(.:format)" => "users#show_user"
  get "/users/:id/products(.:format)" => "products#user_products"
  
  #products
  get "/products/new(.:format)" => "products#new"
  post "/products/create(.:format)" => "products#create"
  get "/products(.:format)" => "products#index"
  get "/products/:id(.:format)" => "products#show"


end
