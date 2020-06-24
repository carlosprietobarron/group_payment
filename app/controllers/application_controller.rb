# rubocop:disable Style/SymbolArray
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, \
                                      keys: [:name, :email, :password, :password_confirmation, :remember_me, :avatar])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, \
                                      keys: [:name, :email, :password, :password_confirmation, :remember_me])
  end

  def authenticate_user!
    if user_signed_in?
      redirect_to user_profile_path
    else
      redirect_to new_user_session_path
    end
  end
end

# rubocop:enable Style/SymbolArray
