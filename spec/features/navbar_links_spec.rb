require 'rails_helper'

RSpec.feature "NavbarLinks", type: :feature do

  before do
    @user = create(:user)
  end

  scenario "when user isn't logged in" do
    visit root_path
    expect(page).to have_link('Facemash')
    expect(page).to have_link('Login')
    expect(page).to have_link('Sign up')
    expect(page).to have_link('Signup with facebook')
    expect(page).not_to have_link('Logout')
  end

  scenario "when user is logged in" do
    login_as(@user)
    visit root_path
    expect(page).to have_link('Facemash')
    expect(page).to have_link('Home')
    expect(page).to have_link('Profile')
    expect(page).to have_link('Notifications(0)')
    expect(page).to have_link('Find friends')
    expect(page).to have_link('Sign out')
  end
end
