class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  def current_user
    @current_user ||= User.first
  end
  helper_method :current_user

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :bio, :photo, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :bio, :photo, :email, :password, :current_password)}
  end


end
