Rails.application.routes.draw do
  devise_for :users
  resources :services
  resources :businesses
  resources :members
  #set welcome page as root/home page
  get "/", to: "pages#welcome", as: "root"

  # get "/tradecategory", to: "trade_category#index", as: "trade_category_services"
  get "/services/category/:category", to: "services#category", as: "services_category"
  
  get "orders", to: "orders#new", as: "new_order"
 
  #display my list of services
  get "/mylist", to: "my_list#index", as: "my_list"
end


 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html