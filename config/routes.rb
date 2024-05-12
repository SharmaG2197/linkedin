Rails.application.routes.draw do

  # Devise routes for admin_users and users
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  # ActiveAdmin routes
  ActiveAdmin.routes(self)

  # Resources for other models
  resources :groups
  resources :members
  resources :groupchats
  resources :messages
  resources :profiles
  resources :friend_requests
  resources :friendships

  # Nested resources for posts, comments, and likes
  resources :posts do
    resources :comments
    resources :likes
  end

  # resources :groups do
  #   resources :members
  # end

  # Custom routes
  get 'friends/index'
  get 'friends/destroy'
  get "/update_user" , to: "friend_requests#update_user"

  # Root route
  root to: "homes#index"

end
