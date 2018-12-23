class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :show, :delete]


  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if !!@user.id
      session[:user_id] = @user.id
      clear_errors
      redirect_to user_path(username: @user.username)
    else
      handle_errors(@user)
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      clear_errors
      redirect_to user_path(username: @user.username)
    else
      handle_errors(@user)
      render :edit
    end
  end

  def show

  end

  def delete
    @user.destroy
    redirect_to '/'
  end

  private

  def handle_errors(user)
    if !!user
      flash[:errors] = user.errors.full_messages
    else
      flash[:errors] = ["Invalid Username or password. Please try again."]
    end
  end

  def clear_errors
    flash[:errors] = nil
  end

  def find_user
    @user = User.find_by(username: params[:username])
  end

  def user_params
    params.require(:user).permit(:username, :name, :password)
  end
end
