require 'rails_helper'
describe CheckCard do

  describe '#call' do

    it "is valid when the texts are not the same" do
      expect(Card.new(original_text: "House", translated_text: "дом")).to be_valid
    end

  end

end
