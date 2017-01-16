# This is class Mailer for send reminders to users
class CardsMailer < ApplicationMailer

  def pending_cards_notification(user)
    RestClient.post "https://api:key-29aa7c8ff424c22a1e6d9267665689a4"\
    "@api.mailgun.net/v3/sandbox2e9b2d96b0eb4df29dbcd013fd958778.mailgun.org/messages",
    :from => "Excited User <mailgun@sandbox2e9b2d96b0eb4df29dbcd013fd958778.mailgun.org>",
    :to => "#{user.email}, devico@sandbox2e9b2d96b0eb4df29dbcd013fd958778.mailgun.org",
    :subject => "Hello",
    :text => "Testing some Mailgun awesomness!"
  end
  # default from: "gregaroyo@gmail.com"

  # def pending_cards_notification(user)
  #   mail(
  #     to: user.email,
  #     subject: "New cards for review on Flashcards",
  #     body: "We remind you that you have a card to review"
  #   )
  # end


end
