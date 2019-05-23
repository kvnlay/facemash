require 'rails_helper'

RSpec.describe Friendship, type: :model do
  subject { build(:friendship) }
  let(:user) { create(:user) }
  let(:friend) { create(:user) }
  let(:friends) { create(:friendship) }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'should be mutual' do
    user.friendships.create(friend_id: friend.id)
    expect(friend.friends[0]).to eq(user)
  end

  it 'destroy should be mutual' do
    user.friendships.create(friend_id: friend.id)
    user.friends.find_by(id: friend.id).destroy
    expect(friend.friends).to eq([])
  end

  it do
    should belong_to(:user)
    should belong_to(:friend)
      .class_name('User')
  end
end
