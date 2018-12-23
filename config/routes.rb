Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#welcome"

  # get "/login", to: "sessions#new", as: "login"
  # post "/", to: "sessions#create"

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/login", to: "sessions#create"

  get "/sign-up", to: "users#new", as: "sign_up"
  post "/", to: "users#create", as: "users"
  get "/:username", to: "users#show", as: "user"
  get "/:username/edit", to: "users#edit", as: "edit_user"
  patch "/:username", to: "users#update", as: "update_user"
  delete "/:username", to: "users#delete", as: "delete_user"
end
