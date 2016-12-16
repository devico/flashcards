FactoryGirl.define do
  factory :card do |item|
    item.original_text 'clean'
    item.translated_text 'чистый'
    item.image 'minion.png'
    item.deck_id 20
    item.user_id 9
  end
end
