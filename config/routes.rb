Rails.application.routes.draw do

  resources :tweets
  root 'tweets#index'
  
  resources :users
  root 'users#index'
  
  get 'top/login'
  post 'top/login'
  get 'top/main'
  root 'top#main'
  get 'top/logout'
  post 'top/logout'
end
