class WelcomeController < ApplicationController
  def index
  end

  def review
    @card = Card.order("RANDOM()").first
  end

  def check
    result = CheckCard.call(
      card_id: card_params[:card_id],
      user_text: card_params[:user_text]
    )
    if result.success?
      redirect_to root_path, notice: "Правильно!"
    else
      redirect_to root_path, notice: "Не правильно!"
    end
  end

    private

    def card_params
      params.require(:check).permit(:card_id, :user_text)
    end
end
