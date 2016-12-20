require "rails_helper"

RSpec.describe CardsMailer, type: :mailer do
  describe "pending_cards_notification" do
    let(:mail) { CardsMailer.pending_cards_notification }
    let(:user) { FactoryGirl.create(:user) }

    it "renders the headers" do
      expect(mail.subject).to eq("New cards for review on Flashcards")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["flashcards@example.org"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("We remind you that you have a card to review")
    end
  end
end
