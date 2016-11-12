require 'rails_helper'
describe Card do

  describe '#check_original_and_translated_text' do

    it "is valid when the texts are not the same" do
      expect(Card.new(original_text: "House", translated_text: "дом")).to be_valid
    end

    it "is not valid when the texts are identical" do
      expect(Card.new(original_text: "Дом", translated_text: " дом")).to_not be_valid
    end

    it "is not valid when original_text is nil" do
      card = Card.new(original_text: "House", translated_text: "дом")
      card.original_text = nil
      expect(card.errors[:original_text]).to include("can't be blank")
    end

    it "is not valid when original_text is nil" do
      card = Card.new(original_text: "House", translated_text: "дом")
      card.translated_text = nil
      expect(card.errors[:translated_text]).to include("can't be blank")
    end

    it "is not valid when original_text is nil" do
      card = Card.new(original_text: "дом", translated_text: "дом")
      expect(card.errors.values).to include("original and translated text can’t be same")
    end

   end

    describe '#set_review_date' do

      it "when original text equal translated text" do
        card = Card.new(original_text: "Next", translated_text: "следующий")
        expect(card.set_review_date).to eq(Date.today + 3.days)
      end

   end
end
