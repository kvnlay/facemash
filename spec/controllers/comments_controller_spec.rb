require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user

  describe "GET #new" do
    it "returns http success" do
      get new_post_comment_path
      expect(assigns(:comment)).to be_a_new(Comment)
      # expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      comment = create(:comment)
      # expect(post.comments.count).to eq(1)
      expect(User.ids).to include(comment.user_id)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
