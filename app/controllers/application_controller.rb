class ApplicationController < ActionController::Base
  # This runs before every single page load
  before_action :current_user

  def current_user
    # Find the user whose ID is stored in the session cookie
    @current_user = User.find_by({ "id" => session["user_id"] })
  end
end
