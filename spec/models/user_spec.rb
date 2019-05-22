# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  context 'validations' do
    before { create(:user) }

    context 'presence' do
      it do should validate_presence_of :name end
      it do should validate_presence_of :email end
      it do should validate_presence_of :password end
    end

    context 'uniqueness' do
      it do should validate_uniqueness_of :email end
    end

    context 'length' do
      it do should validate_length_of(:name) .is_at_most(50) end
      it do should validate_length_of(:email) .is_at_most(255) end
    end

    context 'format' do
      it do should allow_value('MUSA Jabbaaru').for(:name) end
      it do should allow_value('dhh@nonopinionated.com').for(:email) end
      it do should_not allow_value('base@example').for(:email) end
      it do should_not allow_value('blah').for(:email) end
    end
  end

  context 'associations' do
    it do should have_many(:posts).dependent(:destroy) end
    it do should have_many(:likes).dependent(:destroy) end
    it do should have_many(:comments).dependent(:destroy) end
    it do should have_many(:friendships).dependent(:destroy) end
    it do should have_many(:friends).through(:friendships).class_name(:User) end
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
end
