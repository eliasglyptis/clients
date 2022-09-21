Rails.application.routes.draw do

  scope "(:locale)", locale: /en|fr/ do
    resources :clients
    root 'pages#home'
    get '/search', to: 'clients#search'
    devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'logout', edit: 'profile' }
  end
  
end