require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:musa)
    @post = posts(:sample_post1)
    @comment = Comment.new(content: 'Lorem ipsum', user_id: @user.id,\
                           post_id: @post.id)
  end

  test 'should be valid' do
    assert @comment.valid?
  end

  test 'content should be present' do
    @comment.content = '   '
    assert_not @comment.valid?
  end

  test 'content should be at most 60 characters' do
    @comment.content = 'a' * 61
    assert_not @comment.valid?
  end

  should belong_to(:user)
  should belong_to(:post)
end
