Rails.application.routes.draw do
  resources :companies
  root 'sessions#home'
   get '/signup' => 'users#new'
   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'
   get '/logout' => 'sessions#destroy' 
   get '/auth/facebook/callback' => 'sessions#fbcreate' 

  resources :reviews
  resources :restaurants
  resources :users
  resources :companies 

  resources :user do 
    resources :restaurants
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
