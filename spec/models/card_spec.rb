require 'rails_helper'
describe Card do
  before do
    user = FactoryGirl.create(:user)
    deck = FactoryGirl.create(:deck)
  end

  describe '#check_original_and_translated_text' do

    it "is valid when the texts are not the same" do
      expect(Card.new(original_text: "House", translated_text: "дом", user_id: 10, deck_id: 20)).to be_valid
    end

    it "is not valid when the texts are identical" do
      expect(Card.new(original_text: "House", translated_text: " house", user_id: 10, deck_id: 20)).to_not be_valid
    end

    it "is not valid when original_text is nil" do
      card = Card.create(original_text: "", translated_text: "дом", user_id: 5, deck_id: 20)
      expect(card.errors[:original_text]).to include("can't be blank")
    end

    it "is not valid when translated text is nil" do
      card = Card.create(original_text: "House", translated_text: "", user_id: 5, deck_id: 20)
      expect(card.errors[:translated_text]).to include("can't be blank")
    end

    it "is not valid when the texts are identical" do
      card = Card.create(original_text: "дом", translated_text: "дом", user_id: 5, deck_id: 20)
      expect(card.errors.values).to include(["original and translated text can’t be same"])
    end

   end

    describe '#set_review_date' do

      it "when original text equal translated text" do
        card = Card.new(original_text: "Next", translated_text: "следующий", user_id: 5, deck_id: 20)
        expect(card.set_review_date).to eq(Date.today)
      end

   end
end
