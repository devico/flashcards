require 'rails_helper'
describe CheckCard do

  before do
    user = FactoryGirl.create(:user)
    deck = FactoryGirl.create(:deck)
    @card = FactoryGirl.create(:card, original_text: 'clean', translated_text: 'чистый', user_id: user.id, deck_id: deck.id)
  end

  describe '#call' do

    context 'successfull check' do
    
      it "is valid when card is check and return successfully message" do
        result = CheckCard.call(card_id: @card.id, user_text: "clean")
        expect(result.message).to eq('Perfect answer')
      end

      it 'is valid when card is check correctly after 1 probe' do
        CheckCard.call(card_id: @card.id, user_text: "clean")
        card = Card.find_by(id: @card.id)
        expect(card.factor).to eq(2.6)
        expect(card.review_date.strftime('%d-%m-%Y')).to eq(1.days.since.strftime('%d-%m-%Y'))
      end

      it 'is valid when card is check correctly after 2 probe' do
        2.times do
          CheckCard.call(card_id: @card.id, user_text: "clean")
        end
        card = Card.find_by(id: @card.id)
        expect(card.factor).to eq(2.7)
        expect(card.review_date.strftime('%d-%m-%Y')).to eq(6.days.since.strftime('%d-%m-%Y'))
      end

      it 'is valid when card is check correctly after 3 probe' do
        3.times do
          CheckCard.call(card_id: @card.id, user_text: "clean")
        end
        card = Card.find_by(id: @card.id)
        expect(card.factor).to eq(2.8)
        expect(card.review_date.strftime('%d-%m-%Y')).to eq(18.days.since.strftime('%d-%m-%Y'))
      end

      it 'is valid when card is check not correct after 1 probe' do
        CheckCard.call(card_id: @card.id, user_text: "cleeanm")
        card = Card.find_by(id: @card.id)
        expect(card.factor).to eq(2.5)
        expect(card.review_date.strftime('%d-%m-%Y')).to eq(1.days.since.strftime('%d-%m-%Y'))
      end
    end

    context 'fail check' do

      it "is valid when check failed" do
        result = CheckCard.call(card_id: @card.id, user_text: "cleeanm")
        expect(result.message).to eq('Complete blackout')
      end
    end
  end
end
