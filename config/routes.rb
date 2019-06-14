Rails.application.routes.draw do
  authenticated :user do
    root to: 'posts#index', as: :authenticated_root
  end
  root to: 'welcome#index'
  resources :friendships, only: [:create, :destroy]
  resources :friend_requests, only: [:index, :create, :destroy]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:index, :show]
  resources :likes
  resources :comments
  resources :posts, only: [:index, :new, :create, :show, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:new, :show, :create, :destroy]
  end
  get 'privacy_policy', to: 'welcome#policy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
