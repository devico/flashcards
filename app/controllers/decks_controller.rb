class DecksController < ApplicationController
  before_action :require_login
  before_action :set_deck, only: [:show, :edit, :update, :destroy]

  def index
    @decks = Deck.all
  end

  def show
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = current_user.decks.new(params_deck)
      if @deck.save
        redirect_to decks_path, notice: 'The Deck successfull created!'
      else
        render :new
      end
  end

  def destroy
    @deck.destroy
    redirect_to decks_path
  end

  def set_current
    current_user.update(current_deck: params[:id])
    redirect_to root_path
  end

  private

  def set_deck
    @deck = Deck.find(params[:id])
  end

  def params_deck
    params.require(:deck).permit(:name)
  end
end
