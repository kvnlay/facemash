class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || posts_path
  end

  protected

  def configure_permitted_parameters
    # Fields for sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # Fields for editing an existing account
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
