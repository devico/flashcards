FactoryGirl.define do
  factory :user do |item|
    item.email 'dsn@exom.ua'
    item.encrypted_password '123'
    item.id 5
  end
end
