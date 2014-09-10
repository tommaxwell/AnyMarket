Rails.application.routes.draw do
	devise_for :users, :controllers => { :registrations => 'registrations', :confirmations => 'confirmations' }
	default_url_options :host => "anymarket.co"

  root "home#index" 
	
	
	get "/terms(.:format)" => "home#terms"
	get "/about(.:format)" => "home#about"
	
	get "/home/onboarding_modal(.:format)" => "home#onboarding_modal"
	get "/how-it-works(.:format)" => "home#how_it_works"
	get "/home/addpaymentmethod(.:format)" => "home#addpaymentmethod"
	get "/home/salecomplete(.:format)" => "home#salecomplete"
  
  #users
  get "/users/:id(.:format)" => "users#profile"
  get "/users/:id/products(.:format)" => "products#user_products"
  
  #products
  get "/products/new(.:format)" => "products#new", :as => "list_item"
  post "/products/create(.:format)" => "products#create"
	get "/products(.:format)" => "products#search", :as => "products_index"
  get "/products/:id(.:format)" => "products#show", :as => "view_item"
  get "/products/:id/edit(.:format)" => "products#edit", :as => "edit_item"
  patch "/products/:id/update(.:format)" => "products#update"
  delete "/products/:id(.:format)" => "products#destroy", :as => "destroy_item"
	get "/products/photo_preview/:id(.:format)" => "products#photo_preview"
  
  #categories
  get "/categories/new(.:format)" => "categories#new"
  post "/categories/create(.:format)" => "categories#create"
  get "/categories(.:format)" => "categories#categories"
  get "/categories/:id(.:format)" => "categories#show", :as => "view_category"
  get "/conversations/:id/send_message(.:format)" => "conversations#send_message", :as => "send_message"
  post "/conversations/send_this_message(.:format)" => "conversations#send_this_message", :as => "send_this_message"
  
	get "/home/new(.:format)" => "home#new"
	
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

  resources :customer, :only => [:new, :edit]
  resources :credit_card_info, :only => [:edit]

  get 'customer/confirm' => 'customer#confirm', :as => :confirm_customer
  get 'credit_card_info/confirm' => 'credit_card_info#confirm', :as => :confirm_credit_card_info
  get '/transactions/:id/new(.:format)' => 'transactions#new', :as => :new_transaction
  get '/transactions/confirm/:id' => 'transactions#confirm', :as => :confirm_transaction

end
