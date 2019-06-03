# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'validations' do
    before { create(:user) }

    context 'attributes' do
      it { expect(subject).to be_valid }
    end

    context 'presence' do
      it { should validate_presence_of :name }
    end

    context 'uniqueness' do
      it { should validate_uniqueness_of :email }
    end

    context 'length' do
      it { should validate_length_of(:name) .is_at_most(50) }
    end

    context 'format' do
      it { should allow_value('MUSA Jabbaaru').for(:name) }
      it { should allow_value('dhh@nonopinionated.com').for(:email) }
      it { should_not allow_value('base@example').for(:email) }
      it { should_not allow_value('blah').for(:email) }
    end
  end

  describe 'associations' do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it do
      should have_many(:sent_friendships)
        .class_name(:Friendship)
        .with_foreign_key(:adder_id)
        .dependent(:destroy)
    end
    it do
      should have_many(:received_friendships)
        .class_name(:Friendship)
        .with_foreign_key(:added_id)
        .dependent(:destroy)
    end
    it do
      should have_many(:sent_friends)
        .through(:received_friendships)
        .source(:sent_friend)
    end
    it do
      should have_many(:received_friends)
        .through(:sent_friendships)
        .source(:received_friend)
    end
    it do
      should have_many(:received_requests)
        .with_foreign_key(:requested_id)
        .class_name(:FriendRequest).dependent(:destroy)
    end
    it do
      should have_many(:sent_requests)
        .with_foreign_key(:requester_id)
        .class_name(:FriendRequest)
        .dependent(:destroy)
    end
    it do
      should have_many(:requesters)
        .through(:received_requests)
        .source(:requester)
    end
    it do
      should have_many(:requesteds)
        .through(:sent_requests)
        .source(:requested)
    end
  end

  describe 'instance methods' do
    let(:person) { create(:user) }
    let(:friend) { create(:user) }

    context 'instance responds to its methods' do
      it { expect(person).to respond_to(:friends) }
      it { expect(person).to respond_to(:accept_friend) }
    end

    context "#friends" do
      it "List all users friends" do
        expect(person.friends).not_to include(friend)
        expect(friend.friends).not_to include(person)
        Friendship.create(adder_id: person.id, added_id: friend.id)
        person.reload
        friend.reload
        expect(person.friends).to eq([friend])
        expect(friend.friends).to eq([person])
      end
    end

    context '#accept_friend' do
      it 'accepts user as friend' do
        person.accept_friend(friend)
        expect(friend.friends).to eq([person])
      end
    end
  end
end
