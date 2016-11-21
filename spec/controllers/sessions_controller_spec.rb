require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

before do
    @user = FactoryGirl.create(:user)
  end

  describe "GET new" do
    it "returns http success" do
      login_user(@user.username, @user.password)
      expect(response).to render_template("/sessions/new")
    end
  end
end
