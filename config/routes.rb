Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  root "application#welcome", as: "home"
end
