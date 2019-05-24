Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'posts/index'
  get 'posts/show'
  # get 'posts/new'
  # get 'posts/destroy'
  # get 'users/index'
  # get 'users/show'
  root to: 'users#index'
  get 'friendships/index'
  get 'friendships/destroy'
  get 'friend_requests/index'
  get 'friend_requests/create'
  get 'friend_requests/update'
  get 'friend_requests/destroy'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:index, :show]
  resources :posts, only: [:new, :destroy] do
    resources :comments, only: [:new, :show, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
