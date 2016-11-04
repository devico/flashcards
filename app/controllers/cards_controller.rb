class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
  	@card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def create
  	@card = Card.new(card_params)

  	respond_to do |format|
  	  if @card.save
  	  	format.html { redirect_to @card, notice: 'Карточка успешно создана' }
  	  else
  	  	format.html { redirect_to :new }
  	  end
  	end
  end

  private

  def card_params
  	params.require(:card).permit(:original_text, :translated_text, :review_date)
  end

end