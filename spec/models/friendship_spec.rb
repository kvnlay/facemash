require 'rails_helper'

RSpec.describe Friendship, type: :model do
  # subject { create(:friendship) }
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:friendship) { create(:friendship) }

  describe 'validations' do
    it { expect(friendship).to be_valid }

    context 'adding self as friend' do
      let(:invalid_friendship) { build(:invalid_friendship) }
      it 'is invalid' do
        expect(invalid_friendship).to_not be_valid
      end
    end
  end

  describe 'mutual creation and destroy' do
    context 'friendship creation is mutual' do
      it do
        user.sent_friendships.create(added_id: user2.id)
        expect(user2.friends[0]).to eq(user)
      end
    end

    context 'friendship destroy is mutual' do
      it do
        user.sent_friendships.create(added_id: user2.id)
        user.sent_friendships.find_by(added_id: user2.id).destroy
        expect(user2.friends).to eq([])
      end
    end
  end

  describe 'associations' do
    it do
      should belong_to(:sent_friend).class_name('User')
      should belong_to(:received_friend).class_name('User')
    end
  end
end
