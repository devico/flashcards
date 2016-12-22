# This is class Mailer for send reminders to users
class CardsMailer < ApplicationMailer
  default from: "gregaroyo@gmail.com"

  def pending_cards_notification(user)
    mail(
      to: user.email,
      subject: "New cards for review on Flashcards",
      body: "We remind you that you have a card to review"
    )
  end
end
