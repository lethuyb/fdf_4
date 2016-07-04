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
  resources :comments, only: [:create, :new, :show]
  resources :suggests, only: [:index, :create]
  resource :order, only: [:show, :update, :index]
  resources :order_details, only: [:show, :create, :update, :destroy]

  namespace :admin do
    root "products#index"
    resources :products
    resources :users, only: [:index]
    resources :orders, only: [:index, :show]
    resources :categories , only: [:index, :new, :create, :destroy]
    resources :suggests, only: [:index, :destroy]
  end
end
