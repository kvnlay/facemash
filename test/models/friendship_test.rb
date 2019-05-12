require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  def setup
    @user = users(:musa)
    @friend = users(:kingsley)
    @friendship = Friendship.new(user_id: @user.id, friend_id: @friend.id)
  end

  test 'should be valid' do
    assert @friendship.valid?
  end

  test 'user id should be present' do
    @friendship.user_id = nil
    assert_not @friendship.valid?
  end

  test 'friend id should be present' do
    @friendship.friend_id = nil
    assert_not @friendship.valid?
  end
end
