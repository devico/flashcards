require 'rails_helper'

RSpec.describe CardsController, :type => :controller do

  describe "#create" do

    before(:each) do
      current_user = FactoryGirl.create(:user)
    end

    it "redirects to the card's page after create card" do
      post :create, card: FactoryGirl.attributes_for(:card)
      merge({user_id: current_user.id})
      expect(response).to redirect_to(assigns(:card))
    end

    it "renders #new form when validates fail" do
      post :create, card: FactoryGirl.attributes_for(:card)
      merge({original_text: ""})
      expect(response).to render_template("new")
    end
  end

  describe "#show" do

    before do
      card = FactoryGirl.create(:card)
    end

    it "show card page" do
      get :show, id: card.id
      expect(response).to render_template("show")
    end
  end
end



