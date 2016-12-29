class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  private

  def not_authenticated
    redirect_to login_url, alert: t('app.not_auth_alert')
  end

  def set_locale
    if params[:locale].present?
      I18n.locale = params[:locale]
    else
      http_accept_language.compatible_language_from(I18n.available_locales)
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
