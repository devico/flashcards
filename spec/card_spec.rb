require 'rails_helper'
describe Card do

  describe '#check_original_and_translated_text' do
    subject { Card.new(card_params) }

    it "is valid when the texts are not the same" do
      expect(Card.new(original_text: "House", translated_text: "дом")).to be_valid
    end

    it "is not valid when the texts are identical" do
     expect(Card.new(original_text: "Дом", translated_text: " дом")).to_not be_valid
    end
   end
end
