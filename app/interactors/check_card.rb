class CheckCard
  include Interactor
  require 'damerau-levenshtein'

  def call
    @card = Card.find(context.card_id)
    if @card.original_text == context.user_text
      correct_answer
    elsif typo_check
      typo_answer
    else
      incorrect_answer
    end
  end

  def typo_check
    dl = DamerauLevenshtein.distance(@card.original_text, context.user_text)
    level_pass = 0.15
    check_pass = dl.to_f / @card.original_text.size.to_f
    check_pass <= level_pass
  end

  def correct_answer
    @card.increment!(:success_counter)
    @card.fail_counter = 0
    date_for_review = selection_delay(@card.success_counter)
    @card.update(review_date: date_for_review)
    context.card = @card
    context.message = "#{I18n.t('app.check_card.correct_answer')}"
  end

  def typo_answer
    correct_answer
    context.message = "#{I18n.t('app.check_card.typo_answer')} #{card.original_text} #{context.user_text}"
  end

  def incorrect_answer
    @card.increment!(:fail_counter)
    if @card.success_counter >= 3 && @card.fail_counter == 3
      @card.update(review_date: 12.hours.since, success_counter: 0)
    end
    context.card = @card
    context.message = "#{I18n.t('app.check_card.incorrect_answer')}"
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
