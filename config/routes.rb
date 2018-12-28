Rails.application.routes.draw do
  resources :bands
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy, :index]
  resources :sessions, only: [:new, :create, :destroy]

  root "application#welcome", as: "home"
  get "/sessions", to: "sessions#new"
end
