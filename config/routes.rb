Rails.application.routes.draw do

  get "users/new"
  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root "static_pages#home"
  get "home" =>"static_pages#home"
  get "signup" => "users#new"
  get "signin"  => "sessions#new"
  post "signin" => "sessions#create"
  delete "signout" => "sessions#destroy"
end
