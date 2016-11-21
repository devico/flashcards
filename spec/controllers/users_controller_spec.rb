require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "#create" do

    it "redirects to the user's page after create user" do
      post :create, user: { username: "sergey", email: "sergo@ex.ua", password: '2222' }
      expect(response).to redirect_to("/welcome/index")
    end

    it "renders #new form when validates fail" do
      get :new, user: { username: "sergey", email: "sergo@ex.ua", password: "" }
      expect(response).to render_template("/users/new")
    end
  end

  describe "#update" do

    before do
      @user = FactoryGirl.create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

    it "when change user" do
      patch :update, id: @user.id, user: { password: '456' }
      expect(response).to redirect_to("/users/#{ @user.id }")
    end
  end


end
