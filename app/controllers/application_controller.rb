class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token])
  end

  def require_user
    redirect_to root_url if !current_user
  end

  helper_method :current_user
end
