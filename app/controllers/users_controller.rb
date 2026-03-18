class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/"
    else
      render :new  # Or handle errors appropriately
    end
  end

  private

  def user_params
   params.permit(:username, :email, :password)
  end
end
