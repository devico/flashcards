class CheckCard
  include Interactor

  def call
    card = Card.find(context.card_id)
    if card.original_text == context.user_text
      card.review_date = Date.today + 3.days
      card.save
      context.flash = "Правильно"
    else
      context.flash = "Не правильно"
      context.fail!(message: context.flash)
    end
  end
end
