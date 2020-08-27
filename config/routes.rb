Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static#home'

  get '/users/new', to: 'users#new'
  get '/users', to:'users#index'
  post '/users', to:'users#create'
end
