Rails.application.routes.draw do
 
  root 'sessions#home'
   
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
   
   get '/auth/facebook/callback' => 'sessions#fbcreate' 


  resources :restaurants do 
    resources :reviews, only: [:index, :new, :create, :show] 
  end  
  resources :reviews 

  resources :cities do 
    resources :restaurants, only: [:index, :new, :create, :show]
  end 

  resources :users 
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end 
