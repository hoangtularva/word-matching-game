Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "static_pages#home"

  resources :room_user_words
  resources :messages
  resources :room_settings
  resources :room_users
  resources :words
  resources :rooms
  resources :users
end
