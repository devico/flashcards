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
      context.user.current_deck.cards
             .where("review_date <= ?", Time.current).order("RANDOM()").first
    else
      context.user.cards
             .where("review_date <= ?", Time.current).order("RANDOM()").first
    end
  end

  def all_cards
    Card.where("review_date <= ?", Time.current).order("RANDOM()").first
  end
end
