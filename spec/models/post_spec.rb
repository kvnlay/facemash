require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:post) }

  describe 'validations' do
    context 'attributes' do
      it { expect(subject).to be_valid }
    end

    context 'presence of body' do
      it { should validate_presence_of(:body) }
    end

    context 'length of body' do
      it { should validate_length_of(:body) .is_at_most(200) .on(:create) }
    end
  end

  describe 'associations' do
    it { should have_many(:comments) .dependent(:destroy) }
    it { should have_many(:likes) .dependent(:destroy) }
    it { should belong_to(:user) }
  end
end
