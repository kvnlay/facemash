require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { build(:comment) }

  context 'validations' do
    context 'attributes' do
      it { expect(subject).to be_valid }
    end

    context 'presence' do
      it { should validate_presence_of(:content) }
    end

    context 'length' do
      it { should validate_length_of(:content) .is_at_most(60) .on(:create) }
    end
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
