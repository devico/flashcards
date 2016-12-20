namespace :demo do
  desc "This is to send an email to users"
  task(mailusers: :environment) do
    CardsMailer.pending_cards_notification.deliver
  end
end
