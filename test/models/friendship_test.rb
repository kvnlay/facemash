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

  test 'friendship should be mutual' do
    @user.friendships.create(friend_id: @friend.id)
    assert @friend.friends.include? @user
  end

  test 'Friendship destroy should be mutual' do
    @user.friendships.create(friend_id: @friend.id)
    @user.friends.find_by(name: 'Kingsley Omotayo').destroy
    assert @friend.friends.empty?
  end

  should belong_to(:user)
  should belong_to(:friend)
    .class_name('User')
end
