class WelcomeController < ApplicationController
  def index
  end

  def review
    result = ReviewCard.call(user: current_user)
    @card = result.card
    respond_to do |format|
      format.html
      format.json { render json: { 
                    'html' => render_to_string(partial: 'form_review.html.erb', locals: { card: @card })
                  }
      }
    end
  end

  def check
    @result = CheckCard.call(
      card_id: card_params[:card_id],
      user_text: card_params[:user_text]
    )
    respond_to do |format|
      format.html { redirect_to root_path, notice: @result.message }
      format.js
    end
  end

  private

  def card_params
    params.require(:check).permit(:card_id, :user_text, :image, :thumb)
  end

  def deck_params
    params.require(:deck).permit(:deck_id)
  end
end
