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
end
