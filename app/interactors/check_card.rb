class CheckCard
  include Interactor

  def call
    card = Card.find(context.card_id)
    if card.original_text == context.user_text
      card.update(review_date: 3.days.since)
      context.message = "Правильно"
    else
      context.fail!(message: "Не правильно")
    end
  end
end
