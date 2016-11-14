FactoryGirl.define do
  factory :user do |item|
    item.email 'dsn@exom.ua'
    item.encrypted_password '123'
  end
end
