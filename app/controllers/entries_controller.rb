class EntriesController < ApplicationController
  before_action :force_login

  def new
  # THIS IS WHERE THE CHANGE GOES:
    @place = Place.find_by({ "id" => params["place_id"] })
    @entry = Entry.new
    @entry["place_id"] = @place["id"]
  end

  def create
    @entry = Entry.new

    # Use the bracket syntax for consistency with your other controllers
    @entry["title"] = params["entry"]["title"]
    @entry["description"] = params["entry"]["description"]
    @entry["occurred_on"] = params["entry"]["occurred_on"]
    @entry["place_id"] = params["entry"]["place_id"]
    
    # FIX: Use session[:user_id] directly to avoid "undefined method id" errors
    @entry["user_id"] = session[:user_id] 
    
    # Attach the image only if it exists in the params
    if params["entry"]["uploaded_image"]
      @entry.uploaded_image.attach(params["entry"]["uploaded_image"])
    end

    if @entry.save
      redirect_to "/places/#{@entry["place_id"]}", notice: "Entry was successfully created."
    else
      # Re-initialize place_id so the 'new' form doesn't break on re-render
      render :new, status: :unprocessable_entity
    end
  end
end