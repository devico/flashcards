every 1.day, at: '3:00 pm' do
  runner "CardsMailer.pending_cards_notification.deliver"
end
