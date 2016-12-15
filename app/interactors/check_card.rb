class CheckCard
  include Interactor

  def call
    @card = Card.find(context.card_id)
    if @card.original_text == context.user_text
      correct_answer  
    else
      incorrect_answer
    end
  end

  def correct_answer
    @card.success_counter += 1
    @card.save
    @card.fail_counter = 0
    date_for_review = selection_delay(@card.success_counter)
    @card.update(review_date: date_for_review)
    context.message = "Правильно"
    context.card = @card
  end

  def incorrect_answer
    @card.fail_counter += 1
    @card.save
    if @card.success_counter >= 3 && @card.fail_counter == 3
      @card.update(review_date: 12.hours.since, success_counter: 0)
    end
    context.message = "Не правильно"
    context.card = @card
  end

  def selection_delay(counter)
    case counter
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
  end
end
