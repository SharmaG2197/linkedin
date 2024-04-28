Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :groups 
  resources :members
  resources :groupchats
  
  # resources :groups do
  #   resources :members
  # end

  resources :messages
  get 'friends/index'
  get 'friends/destroy'
  devise_for :users
  root to: "homes#index"
  resources :profiles
  
  resources :friend_requests
  get "/update_user" , to: "friend_requests#update_user"
  resources :friendships
  
  resources :posts do 
  resources :comments
  resources :likes
  end 
end
