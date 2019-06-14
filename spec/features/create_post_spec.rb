require 'rails_helper'

RSpec.feature "CreatePosts", type: :feature do
  before :each do
    @user = create(:user)
  end

  it 'creates a post' do
    visit root_path

    click_link 'Login'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    # click_on 'Timeline'

    fill_in 'Your post here', with: 'something'
    click_button 'create post'
    expect(page).to have_content('something')
    assert_current_path posts_path
  end
end
