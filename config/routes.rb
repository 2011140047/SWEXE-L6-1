Rails.application.routes.draw do
  resources :users
  root 'users#index'
  resources :tweets
  root 'tweets#index'
  post 'top/main'
  root 'top#main'
  post 'top/login'
  get 'top/logout'
end
