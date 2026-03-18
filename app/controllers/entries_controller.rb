before_action :force_login
class EntriesController < ApplicationController

  def new
    # This renders the form to create a new entry
  end

  def create
    # 1. Initialize a new Entry object
    @entry = Entry.new

    # 2. Extract data from the "entry" hash in params
    @entry["title"] = params["entry"]["title"]
    @entry["description"] = params["entry"]["description"]
    @entry["occurred_on"] = params["entry"]["occurred_on"]
    @entry["place_id"] = params["entry"]["place_id"]
    
    # 3. Assign the entry to the person currently logged in
    @entry["user_id"] = @current_user.id 
    
    # 4. Attach the uploaded file using Active Storage
    # This line connects the image file to the database record
    @entry.uploaded_image.attach(params["entry"]["uploaded_image"])

    # 5. Save and Redirect
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
