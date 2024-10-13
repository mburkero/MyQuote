Rails.application.routes.draw do
  get 'about/index'
  root 'home#index'
  get '/about', to: 'about#index'
  resources :quote_categories
  resources :quotes
  resources :authors
  resources :categories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
