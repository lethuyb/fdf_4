Rails.application.routes.draw do

  root "static_pages#home"
  get "home" =>"static_pages#home"
  get "signup" => "users#new"
  get "signin"  => "sessions#new"
  post "signin" => "sessions#create"
  delete "signout" => "sessions#destroy"
end
