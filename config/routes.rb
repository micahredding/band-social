Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#welcome", as: "home"

  # get "/login", to: "sessions#new", as: "login"
  # post "/", to: "sessions#create"

  # Session Routing
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/login", to: "sessions#delete"

  # User Creation Routing
  get "/sign-up", to: "users#new", as: "sign_up"
  post "/sign-up", to: "users#create"

  # Authorized User Routing
  get "/:username", to: "users#show", as: "user"
  get "/:username/edit", to: "users#edit", as: "edit_user"
  patch "/:username", to: "users#update", as: "update_user"
  delete "/:username", to: "users#delete", as: "delete_user"
end
