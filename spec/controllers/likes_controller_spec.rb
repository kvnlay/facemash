require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  describe 'Likes controller request specs' do
    login_user

    context 'POST #create' do
      it 'returns a successful response' do
        expect(response).to have_http_status(200)
      end
      it 'create a new post' do
        like = create(:like)
        expect(User.ids).to include(like.user_id)
        expect(Post.ids).to include(like.post_id)
        expect(Like.ids).to include(like.id)
      end
    end

    context 'POST #destroy' do
      it 'returns a successful response' do
        expect(response).to have_http_status(200)
      end
      it 'delete a post' do
        like = create(:post)
        like.destroy
        expect(Like.ids).not_to include(like.id)
      end
    end
  end
end
