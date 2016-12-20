every 1.day, at: '8:25 pm' do
  runner 'CardsMailer.pending_cards_notification.deliver'
end
