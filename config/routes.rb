Rails.application.routes.draw do
  get 'orders/new'
  devise_for :users
  resources :services
  resources :businesses
  resources :members
  #set welcome page as root/home page
  get "/", to: "pages#welcome", as: "root"

  # get "/tradecategory", to: "trade_category#index", as: "trade_category_services"
  get "/services/category/:category", to: "services#category", as: "services_category"
  
  get "orders", to: "orders#new", as: "new_order"
  get "/orders/complete", to:"orders#complete", as: "complete_order"
  post "/orders/webhook", to: "orders#webhook"

  #display my list of services
  get "/businesses/:id", to: "businesses#show", as: "business_page"
  get "/orders/myorder", to: "orders#my_order", as: "my_order"
  get "/businesses/:id/orders", to: "businesses#orders", as: "business_orders"
end


 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html