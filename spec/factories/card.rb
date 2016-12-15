FactoryGirl.define do
  factory :card do |item|
    item.id 29
    item.original_text 'clean'
    item.translated_text 'чистый'
    item.review_date '2016-12-14'
    item.image 'minion.png'
    item.deck_id 20
    item.user_id 9
  end
end
