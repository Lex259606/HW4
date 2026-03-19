class PlacesController < ApplicationController
  before_action :force_login

  def index
    # Only show places belonging to the logged-in user
    @places = Place.where({ "user_id" => session[:user_id] })
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })

    # SECURITY: If the place doesn't belong to the user, kick them out
    if @place.nil? || @place["user_id"] != session[:user_id]
      flash["notice"] = "Access denied."
      redirect_to "/places"
    else
      # Only show entries for this place that belong to THIS user
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => session[:user_id] })
    end
  end

  def new
    # Renders new.html.erb
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place["user_id"] = session[:user_id] # Tie it to the logged-in user
    
    if @place.save
      redirect_to "/places"
    else
      render :new
    end
  end
end

