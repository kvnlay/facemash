require 'rails_helper'

RSpec.feature "CreateComments", type: :feature do
  before do
    @user = create(:user)
    @post = create(:post, user: @user)
  end

  scenario "User creates post, likes/unlikes it" do
    login_as(@user)
    visit user_path(@user)
    expect(page).to have_text(@post.body)
    expect(page).to have_button('Comment')
    click_button "Like"
    fill_in 'Comment...', with: 'Fake comment'
    click_button "Comment"
    expect(page).to have_text('comment successfully added')
  end
end
