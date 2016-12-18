class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:sessions][:username], params[:sessions][:password])
    if user
      redirect_back_or_to welcome_index_url, :notice => "Logged in!"
    else
      flash.now[:alert] = "Username or password was invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to welcome_index_url, notice: "Logged out!"
  end
end
