def current_user
  @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
end

def force_login
  if current_user.nil?
    redirect_to "/login", alert: "Please log in first!"
  end
end

