class ReviewCard
  include Interactor

  def call
    context.card = 
      if context.user
        if context.user.current_deck
          context.user.current_deck.cards
          .where("review_date <= ?", Time.current).order("RANDOM()").first
        else
          context.user.cards
          .where("review_date <= ?", Time.current).order("RANDOM()").first
        end
      else
       Card.where("review_date <= ?", Time.current).order("RANDOM()").first
      end
  end
end
