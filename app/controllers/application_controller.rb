class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :get_current_user

  def get_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
  	end
  end

  def check_login
  	unless session[:user_id]
  		redirect_to root_path
  	end
  end
  


end
