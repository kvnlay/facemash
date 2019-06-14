require 'rails_helper'

RSpec.feature "CreateLikes", type: :feature do
  before do
    @user = create(:user)
    @post = create(:post, user: @user)
  end

  scenario "User creates post, likes/unlikes it" do
    login_as(@user)
    visit user_path(@user)
    expect(page).to have_text(@post.body)
    expect(page).to have_button('Like')
    click_button "Like"
    expect(page).to have_text('You\'ve liked this post')
    expect(page).to have_button('Unlike')
    click_button "Unlike"
    expect(page).to have_button('Like')
  end
end
