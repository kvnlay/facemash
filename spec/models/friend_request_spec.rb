require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  
  describe 'associations' do
    it { should belong_to(:requester) .class_name('User') }
    it { should belong_to(:requested) .class_name('User') }
  end

  describe 'instance methods' do
    let(:user) { create(:user) }
    let(:friend) { create(:user) }
    let(:request) { create(:friend_request) }

    context '#not_friends' do
      it 'returns error if users are already friends' do
        user.sent_friendships.create(added_id: friend.id)
        user.reload
        friend.reload
        req = FriendRequest.new(requester: user, requested: friend)
        expect(req).not_to be_valid
        expect(req.errors.empty?).to eq(false)
        expect(req.errors[:requested]).to include('is already added')
      end
    end

    context '#not_pending' do
      it 'returns error if friend request is pending' do
        req1 = request
        req2 = build(:friend_request, requester: req1.requester, requested: req1.requested)
        expect(req2).not_to be_valid
        expect(req2.errors.empty?).to eq(false)
        expect(req2.errors[:requested]).to include('already requested friendship')
      end
    end

    context '#not_self' do
      it 'returns error if users trys to add self as friend' do
        req = build(:friend_request, requester: user, requested: user)
        expect(req).not_to be_valid
        expect(req.errors.empty?).to eq(false)
        expect(req.errors[:requested]).to include('Can\'t be equal to requester')
      end
    end
  end

end
