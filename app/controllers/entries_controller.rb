class EntriesController < ApplicationController
  before_action :force_login

  def new
    @entry = Entry.new
    @entry["place_id"] = params["place_id"]
  end

  def create
    # 1. Initialize a new Entry object
    @entry = Entry.new

    # 2. Extract data from the "entry" hash in params
    # Using .dig or the nested hash helps prevent crashes if a key is missing
    @entry["title"] = params["entry"]["title"]
    @entry["description"] = params["entry"]["description"]
    @entry["occurred_on"] = params["entry"]["occurred_on"]
    @entry["place_id"] = params["entry"]["place_id"]
    
    # 3. Assign the entry to the person currently logged in
    # We use @current_user.id because before_action :current_user sets this up
    @entry["user_id"] = @current_user.id 
    
    # 4. Attach the uploaded file using Active Storage
    # We wrap this in an 'if' so it doesn't crash if the user forgets a photo
    if params["entry"]["uploaded_image"]
      @entry.uploaded_image.attach(params["entry"]["uploaded_image"])
    end

    # 5. Save and Redirect
    if @entry.save
      redirect_to "/places/#{@entry["place_id"]}", notice: "Entry was successfully created."
    else
      # If save fails (validation error), go back to the 'new' form
      render :new, status: :unprocessable_entity
    end
  end
end