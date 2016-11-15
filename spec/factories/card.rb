FactoryGirl.define do
  factory :card do |item|
    item.original_text 'cloud'
    item.translated_text 'oblako'
    item.review_date (Date.today + 3.days)
    item.user_id 9
  end
end
