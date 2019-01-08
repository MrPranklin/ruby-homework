Rails.application.routes.draw do
  root 'landing#index'

  resources :comments
  resources :posts
  resources :authors

  resources :polynomials, only: [:show, :new, :create] 
end
