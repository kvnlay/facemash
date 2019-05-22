require 'rails_helper'

RSpec.describe Like, type: :model do
  it do
    should belong_to(:user)
    should belong_to(:post)
  end
end
