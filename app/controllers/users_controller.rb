class UsersController < ApplicationController

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to welcome_index_url, :notice => "Welcome to Flashcards!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice: 'Your profile successfully updated'
    else
      render :edit
    end
  end

  def update_current_deck
    current_user.update(set_current_deck)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :confirmation_password, :current_deck)
  end

  def set_current_deck
    params.require(:user).permit(:current_deck)
  end

end
