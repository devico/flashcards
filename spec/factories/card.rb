FactoryGirl.define do
  factory :card do |item|
    item.id 28
    item.original_text 'clean'
    item.translated_text 'чистый'
    item.review_date (Date.today + 3.days)
    item.image 'minion.png'
    item.deck_id 20
    item.user_id 9
  end
end
