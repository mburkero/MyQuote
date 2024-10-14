Rails.application.routes.draw do
  root 'home#index'
  get '/about', to: 'about#index'
  get '/search', to: "search#index"
  resources :quote_categories
  resources :quotes
  resources :authors
  resources :categories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
