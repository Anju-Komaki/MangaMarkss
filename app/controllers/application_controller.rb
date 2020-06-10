class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_locale

  def set_locale
    I18n.locale = locale
  end

  def locale
    @locale ||= params[:locale] ||= I18n.default_locale
  end

  def default_url_options(options = {})
    options.merge(locale: locale)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation,:country])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password])
  end
end
