class ApplicationController < ActionController::Base
  before_action :set_errors, :set_user

  def welcome
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !!@logged_in_user
  end

  def set_user
    @logged_in_user = session[:user_id]
  end

  def set_errors
    @errors = flash[:errors]
  end
end
