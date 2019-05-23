require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'Posts controller request specs' do
    login_user

    context 'GET #index' do
      it 'should success and render to index page' do
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
    end

    context 'GET #show' do
      it 'should success and render to show page' do
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
      end
    end

    context 'POST #create' do
      it 'returns a successful response' do
        get :show
        # expect(response).to be_successful
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
      end
      it 'create a new post' do
        post = create(:post)
        get :show
        expect('Fake post').to eq(post.body)
        expect(User.ids).to include(post.user_id)
        expect(Post.ids).to include(post.id)
      end
    end

    context 'POST #destroy' do
      it 'returns a successful response' do
        get :index
        # expect(response).to be_successful
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
      it 'delete a post' do
        post = create(:post)
        post.destroy
        expect(Post.ids).not_to include(post.id)
      end
    end
  end
end
