require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe "#create" do

    it "redirects to the user's page after create user" do
      post :create, user: { username: "sergey", email: "sergo@ex.ua", password: '2222' }
      expect(response).to redirect_to("/welcome/index")
    end

    it "renders #new form when validates fail" do
      get :new, user: { username: "sergey", email: "sergo@ex.ua", password: "" }
      expect(response).to render_template(:new)
    end
  end

  describe "#update" do

    it "when change user" do
      patch :update, id: @user.id, user: { password: '456' }
      expect(response).to redirect_to("/")
    end
  end


end
