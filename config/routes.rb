Rails.application.routes.draw do
  resources :tweets
  resources :users#, except: :index
  root 'tweets#index'


  get 'signup'  => 'users#new'
end
