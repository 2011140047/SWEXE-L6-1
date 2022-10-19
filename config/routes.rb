Rails.application.routes.draw do

  resources :users
  resources :tweets
  
  root 'top#main'
  
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  
  resources :likes
end
