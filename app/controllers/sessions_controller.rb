class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if !!@user && @user.authenticate(params[:password])
      login(@user)
      redirect_to user_path(@user)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << "Login failed"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to home_path
  end
end
