Rails.application.routes.draw do
  resources :products, only: [ :index, :show]

  get "users/new"
  resources :users

  root "static_pages#home"
  get "home" =>"static_pages#home"
  get "signup" => "users#new"
  get "signin"  => "sessions#new"
  post "signin" => "sessions#create"
  delete "signout" => "sessions#destroy"

  resources :suggests, only: [:index, :create]

  namespace :admin do
    root "products#index"
    resources :products
    resources :users, only: [:index, :new]
    resources :orders, only: [:index, :show]
  end
end
