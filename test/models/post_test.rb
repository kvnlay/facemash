require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:musa)
    @post = Post.new(body: 'Lorem ipsum', user_id: @user.id)
  end

  test 'should be valid' do
    assert @post.valid?
  end

  test 'user id should be present' do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test 'body should be present' do
    @post.body = '   '
    assert_not @post.valid?
  end

  test 'body should be at most 140 characters' do
    @post.body = 'a' * 201
    assert_not @post.valid?
  end

  should belong_to(:user)
  should have_many(:comments)
  should have_many(:likes)
end
