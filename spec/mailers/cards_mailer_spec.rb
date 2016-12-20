require "rails_helper"

RSpec.describe CardsMailer, type: :mailer do
  describe "pending_cards_notification" do
    let(:mail) { CardsMailer.pending_cards_notification }
    let(:user) { User.create(username: 'devico', email: 'devico@example.com') }

    it 'renders the subject' do
      expect(mail.subject).to eq('Remind')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['gregaroyo@gmail.com'])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end
end
