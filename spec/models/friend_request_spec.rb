require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  describe 'associations' do
    it { should belong_to(:requester) .class_name('User') }
    it { should belong_to(:requested) .class_name('User') }
  end
end
