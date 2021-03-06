Rails.application.routes.draw do
  root to: 'home#index'
    
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/pitches' => 'pitches#index'
  get '/contacts' => 'contacts#index'
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :pitches
  end
  
  resources :pitches
  
end
