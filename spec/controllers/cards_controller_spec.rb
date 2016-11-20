require 'rails_helper'

RSpec.describe CardsController, :type => :controller do

  before do
    user = FactoryGirl.create(:user)
  end

  describe "#create" do

    it "redirects to the card's page after create card" do
      post :create, card: { original_text: "Miss", translated_text: "Девушка", user_id: 9}
      expect(response).to redirect_to(assigns(:card))
    end

  end
end



