class OauthsController < ApplicationController
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    if @user == login_from(provider)
      redirect_to root_path, notice: "Logged in from #{provider.titleize}!"
    else
      fail_login_provider
    end
  end

  def fail_login_provider
    @user = create_from(provider)
    reset_session
    redirect_to root_path, notice: "Logged in from #{provider.titleize}!"
  rescue StandardError => e
    redirect_to root_path, alert: "Failed to login from #{provider.titleize}!"
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end
end
