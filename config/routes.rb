Rails.application.routes.draw do
  get 'documentation', to: 'documentation#index'
  get 'documentation/users'
  get 'documentation/posts'

  resources :posts
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'client', to: 'pages#client'
  use_doorkeeper
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :books

  draw :api

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
