class ApplicationController < ActionController::Base
  # To prevent CSRF errors
  protect_from_forgery with: :exception

  # Before controller will run it should clarify that user is logged in
  before_action :authenticate_user!
end
