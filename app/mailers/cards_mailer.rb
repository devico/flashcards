class CardsMailer < ApplicationMailer
  default from: "flashcards@example.org"

  def pending_cards_notification
    users = Card.where("review_date <= ?", Time.current)
                .where.not(user_id: nil).group(:user_id).pluck(:user_id)

    users.each do |id|
      @user = User.find(id)
      # subject = ''
      # body = "Dear, #{user.username}, we remind you that you have a card to review"
      # mail to: user.email, subject, body
      mail(
        to: @user.email,
        subject: "New cards for review on Flashcards",
        body: "We remind you that you have a card to review"
      )
    end
  end
end
