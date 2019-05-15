require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  should belong_to(:requester)
    .class_name('User')
  should belong_to(:requested)
    .class_name('User')
end
