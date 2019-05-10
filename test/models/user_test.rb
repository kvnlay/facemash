require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'email@example.com', password: 'password', password_confirmation: 'password')
  end

  test 'should be valid' do
    assert @user.valid?
  end
end
