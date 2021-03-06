class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_logged_in!
    redirect_to new_sessions_path unless current_user
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

end
