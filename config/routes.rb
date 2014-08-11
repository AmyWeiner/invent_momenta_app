Rails.application.routes.draw do
  # Root Route
  root to: 'static_pages#home'

  # Routes for Static Pages Controller
  get '/home', to: "static_pages#home", as: 'home'
  get '/contact', to: "static_pages#contact", as: 'contact'
  get '/about', to: "static_pages#about", as: 'about'

  # Routes for User Resource
  resources :users 
  get '/signup', to: 'users#new', as: 'signup'

  # Routes for Sessions Resource
  resources :sessions, only: [:new, :create, :destroy]
  get '/signin', to: 'sessions#new', as: 'signin'
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  # Routes for Profile Controller
  get '/users/:id/profile/new', to: 'profiles#new', as: 'user_profile_new'
  #post '/users/:id/profile', to: 'profiles#create', as: 'user_profile'
end
