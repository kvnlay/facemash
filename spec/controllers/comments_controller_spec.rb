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

  describe 'post#create' do
    it 'saves to the database' do
      commenter = create(:user)
      user_post = create(:post)
      comment = create(:comment, post_id: user_post.id, user_id: commenter.id)
      expect do
        post :create, params: {
          comment: {
            user_id: commenter.id,
            content: 'Fake comment'
          },
          comment_id: comment.id
        }
      end.to change(Comment, :count).by(1)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
