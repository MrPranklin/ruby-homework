Rails.application.routes.draw do
  resources :authors
  get 'landing/index'
  
  root 'landing#index'
end
