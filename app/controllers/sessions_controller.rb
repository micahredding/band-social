class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if !!@user && @user.authenticate(params[:password])
      login(@user)
      redirect_to user_path(username: @user.username)
    else
      handle_errors
      redirect_to :login
    end
  end

  private

  def handle_errors
    flash[:errors] = ["Login failed"]
  end
end
