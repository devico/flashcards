class WelcomeController < ApplicationController
  def index
  end

  def review
    @card = Card.order("RANDOM()").first
  end

  def check
    result = CheckCard.call(
      params: card_params,
      card_id: :id,
      user_text: :original_text
    )
    if result.success?
      redirect_to result.card, notice: 'Правильно!'
    else
      redirect_to root, notice: 'Не правильно!'
    end
  end

    private

    def card_params
      params.require(:card).permit(:card_id, :user_text)
    end
end
