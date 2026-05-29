Rails.application.routes.draw do

  root "home#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :reservations, only: [:index, :new, :create, :show]

  namespace :admin do
    resources :reservations, only: [:index, :show, :update]
    resources :menus
  end
end
