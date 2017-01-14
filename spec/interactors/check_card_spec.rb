require 'rails_helper'
describe CheckCard do

  before do
    user = FactoryGirl.create(:user)
    deck = FactoryGirl.create(:deck)
    @card = FactoryGirl.create(:card, original_text: 'clean',
                              translated_text: 'чистый', 
                              user_id: user.id, deck_id: deck.id)
  end

  describe '#call' do

    it "is valid when we have new review date after 2 probe" do
      2.times do
        CheckCard.call(card_id: @card.id, user_text: "clean")
      end
      card = Card.find_by(id: @card.id)
      expect(card.review_date.strftime('%d-%m-%Y')).to eq(6.days.since.strftime('%d-%m-%Y'))
    end

    it "is valid when check is successfully" do
      result = CheckCard.call(card_id: @card.id, user_text: "clean")
      expect(result.message).to eq('Perfect answer')
    end

    it "is valid when check failed" do
      result = CheckCard.call(card_id: @card.id, user_text: "cleeanm")
      expect(result.message).to eq('Complete blackout')
    end
  end
end
