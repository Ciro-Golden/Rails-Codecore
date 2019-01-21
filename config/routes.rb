Rails.application.routes.draw do
  
  root 'pages#index'

  resources :posts

  get 'signup', to: 'users#new'
  resources :users, except: [:new] #want all the routes except the new user Route. 
end
