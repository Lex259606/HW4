class PlacesController < ApplicationController
  # This ensures no one can see any method below without logging in
  before_action :force_login

  def index
    # Only show places created by the logged-in user
    @places = Place.where({ "user_id" => session[:user_id] })
  end

  def show
    # Find the place requested
    @place = Place.find_by({ "id" => params["id"] })

    # Security Check: If the place doesn't belong to the user, redirect them
    if @place["user_id"] != session[:user_id]
      flash["notice"] = "You do not have permission to view that place."
      redirect_to "/places"
    else
      # Only find entries that belong to this place AND this user
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => session[:user_id] })
    end
  end

  def new
    # Renders the 'new' view
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    
    # Tag the new place with the logged-in user's ID
    @place["user_id"] = session[:user_id]
    
    @place.save
    redirect_to "/places"
  end
end

