class CardsController < ApplicationController
  before_action :require_login
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = current_user.cards
  end

  def show
  end

  def new
    @card = current_user.cards.new
    @decks = current_user.decks
  end

  def edit
    @decks = current_user.decks
  end

  def create
    @card = current_user.cards.new(card_params)
      if @card.save
        redirect_to @card
      else
        render :new
      end
  end

  def update
    if @card.update(card_params)
      redirect_to @card
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path
  end

  private

  def set_card
    @card = current_user.cards.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :image, :deck_id, :review_date)
  end
end
