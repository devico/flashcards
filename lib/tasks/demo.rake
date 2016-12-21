namespace :demo do
  desc "This is to send an email to users"
  task(mailusers: :environment) do
    SendNotification.call
  end
end
