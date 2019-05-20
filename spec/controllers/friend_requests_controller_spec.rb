require 'rails_helper'

RSpec.describe FriendRequestsController, type: :controller do
  describe 'Friend_requests controller request specs' do
    login_user

    context 'GET #index' do
      it 'should success and render to index page' do
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
    end

    context 'POST #create' do
      it 'returns a successful response' do
        get :index
        # expect(response).to be_successful
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
      it 'create a new friend request' do
        friend_request = create(:friend_request)
        expect(friend_request.requester_id).not_to eq(friend_request.requested_id)
        expect(User.ids).to include(friend_request.requester_id)
        expect(User.ids).to include(friend_request.requested_id)
        expect(FriendRequest.ids).to include(friend_request.id)
      end
    end

    # context 'POST #update' do
    #   it 'returns a successful response' do
    #     get :index
    #     # expect(response).to be_successful
    #     expect(response).to have_http_status(200)
    #     expect(response).to render_template :index
    #   end
    #   it 'updates a friend_request' do
    #     friend_request = create(:friend_request)
    #     friend_request.update(friend_request.id)
    #     expect(FriendRequest.ids).not_to include(friend_request.id)
    #   end
    # end

    context 'POST #destroy' do
      it 'returns a successful response' do
        get :index
        # expect(response).to be_successful
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
      it 'delete a friend request' do
        friend_request = create(:friend_request)
        friend_request.destroy
        expect(FriendRequest.ids).not_to include(friend_request.id)
      end
    end
  end
end
