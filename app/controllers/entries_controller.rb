class EntriesController < ApplicationController

  def new
    # This renders the form to create a new entry
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    
    # --- ADD THIS LINE ---
    # Assign the entry to the person currently logged in
    @entry["user_id"] = @current_user.id 
    
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
