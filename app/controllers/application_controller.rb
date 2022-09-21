class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def switch_locale(&action)
      I18n.with_locale(params[:locale] || I18n.default_locale, &action)
  end

  def default_url_options
      { locale: I18n.locale }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :organization])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :organization])
  end
end