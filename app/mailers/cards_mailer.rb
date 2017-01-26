# This is class Mailer for send reminders to users
class CardsMailer < ApplicationMailer
  def pending_cards_notification(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['MAILGUN_API']
    message_params =  { from: @user.email,
                      to: @user.email,
                      subject: 'New cards for review on Flashcards!',
                      text:    'We remind you that you have a card to review!'
                    }
    mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params
  end
end
