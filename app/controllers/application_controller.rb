class ApplicationController < ActionController::Base 
  # This is the "magic" line that makes @current_user available in your views
  before_action :current_user

  def current_user
    # We use @current_user so the HTML file can "see" it
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def force_login
    if current_user.nil?
      # Use "notice" to match your application.html.erb flash check
      redirect_to "/login", notice: "Please log in first!"
    end
  end
end
