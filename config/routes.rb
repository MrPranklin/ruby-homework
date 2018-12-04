Rails.application.routes.draw do
  root 'landing#index'

  resources :comments
  resources :posts
  resources :authors

  #get 'landing/index' #not sure if this is necessary

  get 'polynomials/new', to: 'polynomials#new'
  get 'polynomials/:id', to: 'polynomials#show'
  post 'polynomials', to: 'polynomials#create'

  get 'captcha/new', to: 'captcha#new'
  get 'captcha/:captcha', to: 'captcha#show'
  post 'captcha', to: 'captcha#create'
end
