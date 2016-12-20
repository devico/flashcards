namespace :demo do
  desc "This is to send an email to users"
  task(:mail_users => :environment) do
    CardsMailer.pending_cards_notification.deliver                        
  end
end
