FactoryGirl.define do
  factory :user do |item|
    item.username 'test_user '
    item.email 'tst@ex.ua'
    item.password '111'
    item.id 10
  end
end
