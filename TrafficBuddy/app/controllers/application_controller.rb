class ApplicationController < ActionController::Base
  #include SessionsHelper
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_user

  def main
    get_api_key
    render 'main/index'
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end