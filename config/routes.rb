Rails.application.routes.draw do
  root to: 'users#index'
  resources :friendships, only: [:create, :destroy]
  resources :friend_requests, only: [:create, :destroy]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:index, :show]
  resources :posts, only: [:new, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:new, :show, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
