require 'rails_helper'
describe CheckCard do

  describe '#call' do

    context 'successfull check' do
    
      it "is valid when card is check for first time" do
        card = FactoryGirl.create(:card, success_counter: 0)
        result = CheckCard.call(card_id: card.id, user_text: "clean")
        expect(result.card.review_date).to eq(Date.parse(12.hours.since.to_s))
      end

      it "is valid when card is check for second time" do
        card = FactoryGirl.create(:card, success_counter: 1)
        result = CheckCard.call(card_id: card.id, user_text: "clean")
        expect(result.card.review_date).to eq(Date.parse(3.days.since.to_s))
      end

      it "is valid when card is check for third time" do
        card = FactoryGirl.create(:card, success_counter: 2)
        result = CheckCard.call(card_id: card.id, user_text: "clean")
        expect(result.card.review_date).to eq(Date.parse(7.days.since.to_s))
      end

      it "is valid when card is check for fourth time" do
        card = FactoryGirl.create(:card, success_counter: 3)
        result = CheckCard.call(card_id: card.id, user_text: "clean")
        expect(result.card.review_date).to eq(Date.parse(14.days.since.to_s))
      end      

      it "is valid when card is check for fifth time" do
        card = FactoryGirl.create(:card, success_counter: 4)
        result = CheckCard.call(card_id: card.id, user_text: "clean")
        expect(result.card.review_date).to eq(Date.parse(1.month.since.to_s))
      end

      it "is valid when card is check for sixth time" do
        card = FactoryGirl.create(:card, success_counter: 5)
        result = CheckCard.call(card_id: card.id, user_text: "clean")
        expect(result.card.review_date).to eq(Date.parse(1.year.since.to_s))
      end
    end

    context 'fail check' do

      it "is valid when check failed" do
        card = FactoryGirl.create(:card, success_counter: 4, fail_counter: 2)
        result = CheckCard.call(card_id: card.id, user_text: "klean")
        expect(result.card.success_counter).to eq(0)
        expect(result.card.review_date).to eq(Date.parse(12.hours.since.to_s))
      end
    end
  end
end
