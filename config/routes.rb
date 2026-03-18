Rails.application.routes.draw do
  # 1. The Homepage
  root "places#index"

  # 2. Authentication (Login/Logout)
  # We use specific named routes for these to make it easier to link to
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  # 3. Resources (The "Must-Haves")
  resources "places"
  resources "entries"
  resources "users"
  
  # 4. Fallback for the root if you prefer the old syntax:
  # get "/", controller: "places", action: "index"
end

