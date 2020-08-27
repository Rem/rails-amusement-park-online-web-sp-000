Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static#home'

  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'

  resources :users
end
