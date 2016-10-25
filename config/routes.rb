Rails.application.routes.draw do
  root to: 'pitch#index'
  
  get '/pitches' => 'pitch#index'
  get '/contacts' => 'contact#index'
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
end
