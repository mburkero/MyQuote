Rails.application.routes.draw do
  root 'home#index'
  get '/about', to: 'about#index'
  get '/search', to: "search#index"
  
  get '/admin', to: 'home#aindex'
  get '/userhome', to: 'home#uindex'
  get '/your-quotes', to: 'home#uquotes'

  # session routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :quote_categories
  resources :quotes
  resources :authors
  resources :categories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
