class ApplicationController < ActionController::Base
  # To prevent CSRF errors
  protect_from_forgery with: :exception

  # Before controller will run it should clarify that user is logged in
  before_action :authenticate_user!

  # Add 'success' flash type to give some feedback to the user and for more UX
  add_flash_types :success

  # Give permission that devise can take first/last_name, username fields
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :email, :password, :password_confirmation])
  end

  # If nothing found redirect here
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from ActionController::RoutingError, :with => :record_not_found
  def record_not_found
    render 'layouts/404.html.erb'
  end 

  # User update parameters, that allows user make changes without password
  before_action :configure_account_update_params, if: :devise_controller?
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :email])
  end
end
