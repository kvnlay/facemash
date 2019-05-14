require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @user = users(:musa)
    @post = posts(:sample_post1)
    @like = Like.new(user_id: @user.id, post_id: @post.id)
  end

  test 'should be valid' do
    assert @like.valid?
  end

  test 'user id should be present' do
    @like.user_id = nil
    assert_not @like.valid?
  end

  test 'post id should be present' do
    @like.post_id = nil
    assert_not @like.valid?
  end

  should belong_to(:user)
  should belong_to(:post)
end
