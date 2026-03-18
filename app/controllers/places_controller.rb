class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    
    # --- EDIT THIS LINE ---
    # Only find entries for this place AND for the person currently logged in
    if @current_user
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @current_user["id"] })
    else
      @entries = [] # If not logged in, show nothing
    end
  end

  def new
    # This renders the form to create a new place
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

end

