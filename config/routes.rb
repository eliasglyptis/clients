Rails.application.routes.draw do
  root 'pages#home'

  get '/search', to: 'clients#search'
  
  resources :clients
  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'logout', edit: 'profile' }
end