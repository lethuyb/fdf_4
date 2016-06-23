Rails.application.routes.draw do
  get "users/new"
  get "signup" =>"users#new"
  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root "static_pages#home"
end
