describe Card do

  describe '#check_original_and_translated_text' do
    subject { Card.new(card_params) }
    let(:card_params) { { original_text: "Дом", translated_text: " дом" } }
    it { expect(subject.save).to be_falsey }
   end

end
