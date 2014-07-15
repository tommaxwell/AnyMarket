Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root "home#index"
  
  #users
  get "/users/:id(.:format)" => "users#profile"
  get "/users/:id/products(.:format)" => "products#user_products"
  
  #products
  get "/products/new(.:format)" => "products#new", :as => "list_item"
  post "/products/create(.:format)" => "products#create"
  get "/products(.:format)" => "products#index"
  get "/products/:id(.:format)" => "products#show", :as => "view_item"
  get "/products/:id/edit(.:format)" => "products#edit", :as => "edit_item"
  patch "/products/:id/update(.:format)" => "products#update"
  delete "/products/:id(.:format)" => "products#destroy", :as => "destroy_item"
  
  #categories
  get "/categories/new(.:format)" => "categories#new"
  post "/categories/create(.:format)" => "categories#create"
  get "/categories(.:format)" => "categories#categories"
  get "/categories/:id(.:format)" => "categories#show", :as => "view_category"
  
 
  
  
resources :messages do
  member do
    post :new
  end
end

resources :categories do 
  member do 
    get :categories
  end
end

resources :conversations do
  member do
    post :reply
    post :trash
    post :untrash
  end
 collection do
    get :trashbin
    post :empty_trash
 end
end

end
