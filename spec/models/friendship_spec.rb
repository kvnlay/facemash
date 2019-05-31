require 'rails_helper'

RSpec.describe Friendship, type: :model do
  subject { build(:friendship) }
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:friends) { create(:friendship) }

  context 'validations' do
    it { expect(subject).to be_valid }
  end

  context 'mutual' do
    context 'create' do
      it do
        user.sent_friendships.create(added_id: user2.id)
        expect(user2.friends[0]).to eq(user)
      end
    end

    context 'destroy' do
      it do
        user.sent_friendships.create(added_id: user2.id)
        user.sent_friends.find_by(id: user2.id).destroy
        expect(user2.friends).to eq([])
      end
    end
  end

  context 'associations' do
    it do
      should belong_to(:sent_friend).class_name('User')
      should belong_to(:received_friend).class_name('User')
    end
  end
end
