class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to new_session_path
    end
  end

  def signed_in?
    !current_user.nil? 
  end

private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


end

