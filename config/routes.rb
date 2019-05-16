Rails.application.routes.draw do
  get 'friends/index'
  get 'friends/destroy'
  get 'friend_requests/index'
  get 'friend_requests/create'
  get 'friend_requests/update'
  get 'friend_requests/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
