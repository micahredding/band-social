class UsersController < ApplicationController
  before_action :set_requested_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if !!@user.id
      login(@user)
      redirect_to user_path(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @permitted_roles = ["3", "4"]
    handle_auth
  end

  def edit
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


  def destroy
    @permitted_roles = ["3", "4"]
    handle_auth
    @requested_user.destroy
    byebug
    flash[:success] = "Destroyed"
    reset_session
    redirect_to home_path
  end

  private

  def set_requested_user
    if User.exists?(params[:id])
      @requested_user = User.find(params[:id])
    else
      flash[:errors] ||= []
      flash[:errors] << "Invalid User"
      redirect_to home_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :name, :password)
  end

  def handle_auth
    unless logged_in?(@requested_user) || authorized?(@logged_in_user, @permitted_roles)
      flash[:errors] ||= []
      flash[:errors] << "Not Authorized!"
      redirect_to home_path
    end
  end
end
