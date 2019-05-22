require 'rails_helper'

RSpec.describe FriendsController, type: :controller do
  login_user

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end

    it "populates an array of friends" do
      user = create(:user)
      subject.current_user.friends << user
      get :index
      assigns(:friends).should eq([user])
    end
  end

end
