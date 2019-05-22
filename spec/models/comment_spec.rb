require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { build(:comment) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it { should validate_presence_of(:content) }

  it do
    should validate_length_of(:content)
      .is_at_most(60)
      .on(:create)
  end

  it do
    should belong_to(:user)
    should belong_to(:post)
  end
end
