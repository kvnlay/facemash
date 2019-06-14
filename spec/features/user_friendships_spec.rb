require 'rails_helper'

RSpec.feature "UserFriendships", type: :feature do
  before do
    @user = create(:user)
    @friend = create(:user)
    @requested = create(:user)
    @requester = create(:user)
  end

  scenario 'user sending request to other users' do
    login_as(@user)
    visit user_path(@friend)
    expect(page).to have_button('Add friend')
    click_button('Add friend')
    expect(page).to have_button('Request pending', disabled: true)
    click_link('Sign out')
    click_link('Login')
    fill_in "Email",    with: @friend.email
    fill_in "Password", with: @friend.password
    click_button "Log in"
    expect(page).to have_text('Notifications(1)')
    click_link('Notifications(1)')
    assert_current_path friend_requests_path
    click_button 'Accept request'
    expect(page).not_to have_button('Accept request')
    expect(page).to have_text('Notifications(0)')
    visit user_path(@user)
    expect(page).to have_button('Unfriend')
    click_button 'Unfriend'
    expect(page).to have_button('Add friend')
  end

  scenario 'User sending request twice' do
    login_as(@requester)
    visit user_path(@requested)
    expect(page).to have_button('Add friend')
    create(:friend_request, requester: @requested, requested: @requester)
    click_button 'Add friend'
    expect(page).to have_text('Error sending friend request')
    expect(page).to have_button('Accept request')
    expect(page).to have_button('Decline request')
  end
end
