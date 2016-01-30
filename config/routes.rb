Rails.application.routes.draw do
  resources :tweets
  resources :users
  root 'tweets#index'
end
