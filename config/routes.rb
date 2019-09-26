Rails.application.routes.draw do
 
  root 'sessions#home'
   get '/signup' => 'users#new' 
   post '/signup' => 'users#create' 
   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'
   get '/logout' => 'sessions#destroy' 
   get '/auth/facebook/callback' => 'sessions#fbcreate' 

  
  resources :users
  resources :cities 
  resources :reviews 
  resources :restaurants 

   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end 
