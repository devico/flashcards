require 'rails_helper'

RSpec.describe CardsController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe "#index" do

    it "show all cards" do
      get :index
      expect(response).to render_template("index")
      expect(response).to have_http_status(:success)
    end
  end

  describe "#show" do

    it "show card page" do
      @card = FactoryGirl.create(:card)
      get :show, card: {id: @card.id}
      expect(response).to render_template("show")
    end
  end

  describe "#create" do

    it "redirects to the card's page after create card" do
      post :create, card: { original_text: "Miss", translated_text: "девушка" }
      expect(response).to redirect_to("/cards/#{Card.last.id}")
    end

    it "renders #new form when validates fail" do
      get :new, card: { original_text: "", translated_text: "природа" }
      expect(response).to render_template("/cards/new")
    end
  end

  describe "#update" do

    it "when change card" do
      @card = FactoryGirl.create(:card)
      get :update, id: @card.id, card: {original_text: 'Megacloud'}
      expect(response).to redirect_to("/cards/#{Card.find(@card.id)}")
    end
  end


  describe "#destroy" do

    it "when card need to delete" do
      @card = FactoryGirl.create(:card)
      delete :destroy, id: @card.id
      expect(response).to redirect_to("cards_path")
    end
  end
end
