class ApplicationController < ActionController::Base
  # include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %I[name username avatar])
  end
end
