require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:post) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it { should validate_presence_of(:body) }

  it do
    should validate_length_of(:body)
      .is_at_most(200)
      .on(:create)
  end

  it do
    should have_many(:comments)
      .dependent(:destroy)
  end

  it do
    should have_many(:likes)
      .dependent(:destroy)
  end

  it do
    should belong_to(:user)
  end
end
