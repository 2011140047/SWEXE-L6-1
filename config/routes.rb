Rails.application.routes.draw do
  resources :users
  root 'users#index'
  resources :tweets
  root 'tweets#index'
end
