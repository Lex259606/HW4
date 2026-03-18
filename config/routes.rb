Rails.application.routes.draw do
  # This sets your homepage to the list of places
  get("/", { :controller => "places", :action => "index" })

  # Custom routes for a better user experience
  get("/login", { :controller => "sessions", :action => "new" })
  
  # --- ADD THIS LINE BELOW ---
  post("/login", { :controller => "sessions", :action => "create" })
  # ---------------------------

  get("/logout", { :controller => "sessions", :action => "destroy" })

  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"
end

