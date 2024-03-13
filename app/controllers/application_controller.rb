class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include DeviseTokenAuth::Concerns::SetUserByToken

  protected

  def configure_permitted_parameters
    # Permit additional fields for sign-up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :admin, :nickname, :image])
  end

  # Add a new action to handle logout
  def logout
    # Implement your logout logic here
    # Typically, you would invalidate the user's authentication token
    # and sign them out
    # For Devise Token Auth, you can clear the token as follows:
    current_user&.tokens&.destroy_all
    head :no_content
  end
end
