Rails.application.routes.draw do
  # root path
  root "home#index"

  #Users path
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  #sessions Path
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  #weather
  get '/weather', to: 'weather#index'


end
