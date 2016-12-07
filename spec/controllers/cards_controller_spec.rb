require 'rails_helper'

RSpec.describe CardsController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe "#index" do

    it "show all cards" do
      get :index
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#show" do

    it "when card page select for preview" do
      @deck = FactoryGirl.create(:deck)
      @card = FactoryGirl.create(:card)
      get :show, id: @card.id
      expect(response).to render_template(:show)
    end
  end

  describe "#create" do

    it "redirects to the card's page after create card" do
      @deck = FactoryGirl.create(:deck)
      post :create, card: { original_text: "Mister", translated_text: "парень", deck_id: @deck.id }
      expect(response).to redirect_to("/cards/#{@deck.cards.last.id}")
    end

    it "renders #new form when validates fail" do
      get :new, card: { original_text: "", translated_text: "вода" }
      expect(response).to render_template(:new)
    end
  end

  describe "#update" do

    it "when change card" do
      @deck = FactoryGirl.create(:deck)
      @card = FactoryGirl.create(:card)
      get :update, id: @card.id, card: {original_text: 'Gigacloud'}
      expect(response).to redirect_to("/cards/#{ @card.id }")
    end
  end


  describe "#destroy" do

    it "when card need to delete" do
      @deck = FactoryGirl.create(:deck)      
      @card = FactoryGirl.create(:card)
      delete :destroy, id: @card.id
      expect(response).to redirect_to("/cards")
    end
  end
end
