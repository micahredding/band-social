class UsersController < ApplicationController
  before_action :set_requested_user

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if !!@user.id
      redirect_to user_path(@user.username)
    else
      handle_errors(@user)
      render :new
    end
  end

  def edit
    # Set permissions
    @permitted_roles = ["3", "4"]

    handle_auth

    render :edit
  end

  def update
    @permitted_roles = ["3", "4"]
    if @user.update(user_params)
      redirect_to user_path(@user.username)
    else
      handle_errors(@user)
      render :edit
    end
  end

  def show
    # Set permissions
    @permitted_roles = ["1", "2", "3", "4"]
    render :show
  end

  def delete
    @permitted_roles = ["3", "4"]
    @user.destroy
    redirect_to home_path
  end

  private

  def set_requested_user
    @requested_user = User.find_by(username: params[:username])
    if !@requested_use
      custom_error("Invalid User")
      redirect_to home_path
    end
  end

  def handle_errors(user)
    flash[:errors] = user.errors.full_messages
  end

  def user_params
    params.require(:user).permit(:username, :name, :password)
  end

  def handle_auth
    unless logged_in?(@user) || authorized?(@logged_in_user, @permitted_roles)
      custom_error("Not Authorized!")
      redirect_to home_path
    end
  end
end
