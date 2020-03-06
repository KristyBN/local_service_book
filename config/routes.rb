Rails.application.routes.draw do
  devise_for :users
  resources :services
  resources :businesses
  resources :members

  get "/", to: "pages#welcome", as: "root"
  get "/services/category/:category", to: "services#category", as: "services_category"
  # get "/tradecategory", to: "trade_category#index", as: "trade_category_services"
  get "orders", to: "orders#new", as: "new_order"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
