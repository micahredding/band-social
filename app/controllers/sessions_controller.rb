class SessionsController < ApplicationController

  def new
  end
  
  def create
    @user = User.find_by(username: params[:username])
    if !!@user && @user.authenticate(params[:password])
      login(@user)
      redirect_to user_path(@user.username)
    else
      flash[:errors] = ["Login failed"]
      redirect_to login_path
    end
  end
  def delete
    reset_session
    redirect_to home_path
  end
end
