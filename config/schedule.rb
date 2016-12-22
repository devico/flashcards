every 1.day, at: '3:55 pm' do
  runner 'SendNotification.call', environment: 'development'
end
