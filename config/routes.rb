Rails.application.routes.draw do

  resources :users
  resources :posts

  root   'posts#home'
  get    '/login'      => 'sessions#new',     as: :login
  post   '/login'      => 'sessions#create'
  delete '/logout'     => 'sessions#destroy', as: :logout
  get    '/share/:id'  => 'posts#share',      as: :share
  # post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
