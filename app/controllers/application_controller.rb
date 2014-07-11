class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
  	unless current_user
  		flash[:alert] = 'You must login'
  		redirect_to new_user_path
  	end
  end

  helper_method :current_user
end
