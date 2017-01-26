class Dashboard::SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:sessions][:username], params[:sessions][:password])
    if user
      redirect_back_or_to home_welcome_index_url, :notice => t('sessions.notice_create_success')
    else
      flash.now[:alert] = t('sessions.notice_create_fail')
      render :new
    end
  end

  def destroy
    logout
    redirect_to home_welcome_index_url, notice: t('sessions.notice_destroy')
  end
end
