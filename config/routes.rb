Rails.application.routes.draw do
 
  root 'sessions#home'
   
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
   
   get '/auth/facebook/callback' => 'sessions#fbcreate' 

  
  resources :users
  resources :cities 
  resources :reviews 
  resources :restaurants 

   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end 
