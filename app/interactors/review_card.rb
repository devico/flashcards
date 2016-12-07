class ReviewCard
  include Interactor

  def call
    context.card = if context.user
                     if context.user.current_deck
                       context.user.current_deck.cards.order("RANDOM()").first
                     else
                       context.user.cards.order("RANDOM()").first
                     end
                   else
                      Card.order("RANDOM()").first
                   end
  end
end
