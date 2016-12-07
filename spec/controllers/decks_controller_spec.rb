require 'rails_helper'

RSpec.describe DecksController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe "#index" do

    it "show all decks" do
      get :index
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:success)
    end
  end

  describe "#show" do

    it "when deck selected for preview" do
      @deck = FactoryGirl.create(:deck)
      get :show, id: @deck.id
      expect(response).to render_template(:show)
    end
  end

  describe "#create" do

    it "redirects to the deck's page after create" do
      post :create, deck: { name: "Natural Science", user_id: @user.id }
      expect(response).to redirect_to("/decks")
    end

    it "renders #new form when validates fail" do
      get :new, deck: { name: "", user_id: @user.id }
      expect(response).to render_template(:new)
    end
  end

end
