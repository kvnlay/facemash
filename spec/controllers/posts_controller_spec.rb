require 'rails_helper'
require 'spec_helper'

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
        get :show
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
      end
    end

    context 'POST #create' do
      it 'create a new post' do
        post = create(:post)
        get :show
        expect(response).to be_successful
        # expect(response).to include("Test post")
      end
    end
  end
end
