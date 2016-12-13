class CheckCard
  include Interactor

  def call
    card = Card.find(context.card_id)
    if card.original_text == context.user_text
      card.success_counter += 1
      date_for_review = case card.success_counter
                        when 1
                          12.hours.since
                        when 2
                          3.days.since
                        when 3
                          7.days.since
                        when 4
                          14.days.since
                        when 5
                          1.month.since
                        else
                          1.year.since
                        end 
      card.update(review_date: date_for_review)
      context.message = "Правильно"
    else
      card.fail_counter += 1
      context.fail!(message: "Не правильно")
      
    end
  end
end

