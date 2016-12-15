require 'rails_helper'
describe CheckCard do

  describe '#call' do

    context 'successfull check' do
    
      before(:each) do
        @card = FactoryGirl.create(:card)
        user_text = 'clean'
      end

      it "is valid when card is check for first time" do
        @card.success_counter = 1
        @card.save
        expect(@card.review_date).to eq(Date.parse(12.hours.since.to_s))
      end

      it "is valid when card is check for second time" do
        @card.success_counter = 2
        @card.save
        expect(@card.review_date).to eq(Date.parse(3.days.since.to_s))
      end

      # it "is valid when card is check for third time" do
      #   @card.success_counter = 3
      #   @card.save
      #   expect(@card.review_date).to eq(Date.parse(7.days.since.to_s))
      # end

      # it "is valid when card is check for fourth time" do
      #   @card.update(review_date: Date.today)
      #   @card.success_counter = 4
      #   @card.save
      #   expect(@card.review_date).to eq(Date.parse(14.days.since.to_s))
      # end

      # it "is valid when card is check for fifth time" do
      #   @card.success_counter = 5
      #   @card.save
      #   expect(@card.review_date).to eq(Date.parse(1.month.since.to_s))
      # end


      after(:each) do
        @card.update(review_date: Date.today)
      end
    end
  end
end
