class ApplicationController < ActionController::Base
  #include SessionsHelper
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper


  def main
    get_api_key
    render 'main/index'
  end

end