every 1.day, at: '1:42 pm' do
  runner "CardsMailer.pending_cards_notification.deliver"
end
