Rails.application.routes.draw do
  get 'sessions/new'

  resources :tweets
  resources :users
  root 'tweets#index'


  get  '/signup', to: 'users#new'
  get  '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
