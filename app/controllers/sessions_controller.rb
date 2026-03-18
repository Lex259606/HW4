class SessionsController < ApplicationController
  def new
    # This just renders the login form (new.html.erb)
  end

  def create
    # 1. Find the user by their email
    @user = User.find_by({ "email" => params["email"] })

    # 2. Check if the user exists AND the password is correct
    if @user && @user.authenticate(params["password"])
      # 3. Store the user's ID in a "cookie" so the browser remembers them
      session["user_id"] = @user.id
      flash[:notice] = "Welcome, #{@user.username}!"
      redirect_to "/places"
    else
      # 4. If login fails, send them back to try again
      flash[:notice] = "Incorrect email or password."
      redirect_to "/login"
    end
  end

  def destroy
    # Log the user out by clearing the session
    session["user_id"] = nil
    flash[:notice] = "Logged out successfully."
    redirect_to "/login"
  end
end

  