class ApplicationController < ActionController::Base
  before_action :set_logged_in_user

  def welcome
  end

  def login(user)
    reset_session
    session[:user_id] = user.id
  end

  def add_error_message(message)
    flash[:errors] ||= []
    flash[:errors] << message
  end

  private

  def set_logged_in_user
    if !!session[:user_id] && User.exists?(session[:user_id])
      @logged_in_user = User.find(session[:user_id])
    else
      @logged_in_user = nil
    end
  end
end
