Rails.application.routes.draw do
  root 'landing#index'

  resources :comments
  resources :posts
  resources :authors
  
  resources :polynomials, only: [:show, :new, :create] 
  
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show'
  get 'users/new', to: 'users#new'
end
