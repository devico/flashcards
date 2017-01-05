class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  private

  def not_authenticated
    redirect_to login_url, alert: t('app.not_auth_alert')
  end

  def set_locale
    locale = select_locale(current_user, params[:locale], session[:locale])

    return unless locale && I18n.available_locales.include?(locale.to_sym)
    session[:locale] = I18n.locale = locale.to_sym
  end

  def select_locale(user, params, session)
    if user && !user.locale.blank?
      user.locale
    elsif params
      params
    elsif session
      session
    else
      http_accept_language.compatible_language_from(I18n.available_locales)
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
