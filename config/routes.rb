Rails.application.routes.draw do
  # root 'sessions#home'
  # get '/signup' => 'users#new'
  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'

  resources :reviews
  resources :restaurants
  resources :users

  resources :user do 
    resources :restaurants, only: [:new, :create, :edit, :delete] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
