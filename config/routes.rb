Rails.application.routes.draw do
  resources :reviews, only: [:show, :new, :create, :edit]
  resources :restaurants, only: [:index, :show, :new, :create, :edit, :update]
  resources :users, only: [:new, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
