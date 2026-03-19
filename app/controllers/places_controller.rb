class PlacesController < ApplicationController
before_action :force_login
  def index
  # Filter by the logged-in user's ID
  @places = Place.where({ "user_id" => session[:user_id] })
end


def show
  @place = Place.find_by({ "id" => params["id"] })
  
  # This version is safer and matches your index logic
  @entries = Entry.where({ 
    "place_id" => @place["id"], 
    "user_id" => session["user_id"] 
  })
end
  end

  def new
    # This renders the form to create a new place
  end

 def create
  @place = Place.new
  @place["name"] = params["name"]
  
  # Assign the place to the person logged in
  @place["user_id"] = session[:user_id]
  
  @place.save
  redirect_to "/places"
end
end

