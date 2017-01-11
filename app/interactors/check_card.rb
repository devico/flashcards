class CheckCard
  include Interactor

  def call
    @card = Card.find(context.card_id)
    verification = VerifyCard.new({ original_text: @card.original_text,
                                   user_text: context.user_text,
                                   factor: @card.factor,
                                   probe: @card.probe,
                                   repetition: @card.repetition }).set_new_preview_date
    @card.update(factor: verification[:factor],
                 probe: verification[:probe],
                 repetition: verification[:repetition],
                 review_date: verification[:repetition].days.since)
    grade_scale = verification[:grade_scale]
    notice = case grade_scale
      when 5 then I18n.t('app.check_card.perfect_answer')
      when 4 then I18n.t('app.check_card.good_answer')
      when 3 then I18n.t('app.check_card.typo_answer')
      when 2 then I18n.t('app.check_card.much_mistakes_answer')
      when 1 then I18n.t('app.check_card.incorrect_answer')
      else I18n.t('app.check_card.failed')
      end  
    context.notice = notice
  end
end
