class ApplicationController < ActionController::Base
  before_action :set_errors, :set_logged_in_user


  def welcome
  end

  def set_logged_in_user
    !!session[:user_id] ? @logged_in_user = User.find(session[:user_id]) : @logged_in_user = nil
  end

  def login(user)
    reset_session
    session[:user_id] = user.id
  end

  def logged_in?(user)
    user == @logged_in_user
  end

  def authorized?(user, permitted_roles)
    !!user && permitted_roles.include?(user.role)
  end

  def custom_error(message)
    flash[:errors] ||= []
    flash[:errors] << message
  end

  private

  def set_errors
    @errors = flash[:errors]
  end
end
