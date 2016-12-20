every 1.day, at: '4:46 pm' do
  runner 'CardsMailer.pending_cards_notification.deliver', environment: 'development'
end
