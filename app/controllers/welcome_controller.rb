class WelcomeController < ApplicationController

  def index
  end

  # def review
  #   @card = if current_user
  #             current_user.current_deck.cards.order("RANDOM()").first
  #           else
  #             Card.order("RANDOM()").first
  #           end
  # end

  def review
    result = ReviewCard.call(user: current_user)
    @card = result.card
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
