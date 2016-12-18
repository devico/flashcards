class ReviewCard
  include Interactor

  def call
    context.card = if context.user
                     cards_current_user
                   else
                     all_cards
                   end
  end

  def cards_current_user
    if context.user.current_deck
      cards_current_deck
    else
      all_cards_user
    end
  end

  def all_cards
    Card.where("review_date <= ?", Time.current).order("RANDOM()").first
  end

  def cards_current_deck
    context.user.current_deck.cards.where("review_date <= ?", Time.current).order("RANDOM()").first

  end

  def all_cards_user
    context.user.cards.where("review_date <= ?", Time.current).order("RANDOM()").first
  end
end
