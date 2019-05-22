require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  it do
    should belong_to(:requester)
      .class_name('User')
    should belong_to(:requested)
      .class_name('User')
  end
end
