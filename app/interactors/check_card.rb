class CheckCard
  include Interactor

  def call
    @card = Card.find(context.card_id)
    new_review_date = CalculateReviewDate.new({ original_text: @card.original_text,
                        user_text: context.user_text,
                        factor: @card.factor,
                        probe: @card.probe,
                        repetition: @card.repetition }).set_new_preview_date
    @card.update(factor: new_review_date[:factor],
                 probe: new_review_date[:probe],
                 repetition: new_review_date[:repetition],
                 review_date: new_review_date[:repetition].days.since)
    answer_message(new_review_date[:grade_scale])
  end  

  def answer_message(grade_scale)
    notice = case grade_scale
      when 5 then I18n.t('app.check_card.perfect_answer')
      when 4 then I18n.t('app.check_card.good_answer')
      when 3 then I18n.t('app.check_card.typo_answer')
      when 2 then I18n.t('app.check_card.much_mistakes_answer')
      when 1 then I18n.t('app.check_card.incorrect_answer')
      else I18n.t('app.check_card.failed')
      end  
    context.message = notice
  end
end
