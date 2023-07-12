Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :profiles
  resources :posts do 
  resources :comments
  resources :likes
  end 
end
