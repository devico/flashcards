require 'rails_helper'

RSpec.describe CardsController, :type => :controller do

  describe "#create" do

   before do
      @user = FactoryGirl.create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "redirects to the card's page after create card" do
      post :create, card: { original_text: "Miss", translated_text: "девушка" }
      expect(response).to redirect_to(card_path(Card.last))
    end

    # it "renders #new form when validates fail" do
    #   post :create, card: FactoryGirl.attributes_for(:card)
    #   merge({original_text: ""})
    #   expect(response).to render_template("new")
    # end
  end

  # describe "#show" do

  #   before do
  #     @user = FactoryGirl.create(:user)
  #     @card = FactoryGirl.create(:card)
  #     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  #   end

  #   it "show card page" do
  #     get :show, card: {id: @card.id}
  #     expect(response).to render_template("show")
  #   end
  # end
end



