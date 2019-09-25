Rails.application.routes.draw do
  resources :cities
  resources :companies
  root 'sessions#home'
   get '/signup' => 'users#new'
   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'
   get '/logout' => 'sessions#destroy' 
   get '/auth/facebook/callback' => 'sessions#fbcreate' 

  
  resources :users
 
  resources :restaurants 

   resources :cities do 
     resources :restaurants, only [:new, :create, :index]
     resources :reviews, only: [:new, :create, :index] 
   end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end 
