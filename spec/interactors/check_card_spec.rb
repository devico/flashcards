require 'rails_helper'
describe CheckCard do

  describe '#call' do

    it "is valid when card is check" do
      card = Card.new(original_text: "Sound", translated_text: "звук")
      user_text = 'Sound'
      expect(card.original_text).to eq(user_text)
    end
   end
end
