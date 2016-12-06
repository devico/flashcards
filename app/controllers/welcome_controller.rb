class WelcomeController < ApplicationController

  def index
  end

  def review
    if current_user
      @card = Deck.find(current_user.current_deck).cards.sample
    else
      @card = Card.order("RANDOM()").first
    end
  end

  def check
    result = CheckCard.call(
      card_id: card_params[:card_id],
      user_text: card_params[:user_text]
    )
    redirect_to root_path, notice: result.message
  end

  private

  def card_params
    params.require(:check).permit(:card_id, :user_text, :image)
  end

  def deck_params
    params.require(:deck).permit(:deck_id)
  end
end
