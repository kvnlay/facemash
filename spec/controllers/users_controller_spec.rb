require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      user = create(:user)
      get :show, params: { id: user.id }
      # expect(response).to have_http_status(:success)
      response.should render_template :show
    end
  end

end
