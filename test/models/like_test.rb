require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:post)
end
