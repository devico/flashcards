class CheckCard
  include Interactor

  def call
    card = Card.find(context.card_id)
    if card.original_text == context.user_text
      card.review_date = Date.today + 3.days
      card.update(card.id)
      redirect_to root
    else
      context.fail!
    end
  end
end
