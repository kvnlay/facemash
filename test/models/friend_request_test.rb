require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  def setup
    @requester = users(:musa)
    @requested = users(:kingsley)
    @friend_request = FriendRequest.new(requester_id: @requester.id,\
                                        requested_id: @requested.id)
  end

  test 'should be valid' do
    assert @friend_request.valid?
  end

  test 'requester id should be present' do
    @friend_request.requester = nil
    assert_not @friend_request.valid?
  end

  test 'requested id should be present' do
    @friend_request.requested = nil
    assert_not @friend_request.valid?
  end

  should belong_to(:requester)
    .class_name('User')
  should belong_to(:requested)
    .class_name('User')
end
