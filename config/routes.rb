Rails.application.routes.draw do
  get 'sessions/new'

  resources :tweets

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships,       only: [:create, :destroy]

  root 'tweets#index'

  get    '/home',   to: 'home#index'
  get    '/signup', to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
