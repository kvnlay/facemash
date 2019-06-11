require 'rails_helper'

RSpec.feature "UsersShows", type: :feature do
  before do
    @user = create(:user)
    @friend = create(:user)
    @random = create(:user)
    @requester = create(:user)
    create(:friendship, sent_friend: @user, received_friend: @friend)
    create(:friend_request, requester: @requester, requested: @user)
    @post = create(:post, user: @user)
  end

  scenario "User visiting their own profile" do
    login_as(@user)
    visit user_path(@user)
    expect(page).to have_content("#{@user.name}")
    expect(page).to have_content("#{@user.email}")
    assert_current_path user_path(@user.id)
    @user.posts.each do |post|
      expect(page).to have_text(post.body)
    end
    expect(page).to have_css("img[src*='secure.gravatar.com']")
    expect(page).to have_button('Edit Profile')
    expect(page).to have_button('create post')
    expect(page).to have_button('delete')
    expect(page).to have_link('My Feed')
    expect(page).to have_link('Edit profile')
    expect(page).to have_link('Overview')
    expect(page).to have_link('Notifications')
  end

  scenario "user visiting friends profile" do
    login_as(@user)
    visit user_path(@friend)
    expect(page).to have_text("There are no posts")
    expect(page).to have_content("#{@friend.name}")
    expect(page).to have_content("#{@friend.email}")
    expect(page).to have_link('Overview')
    expect(page).to have_button('Unfriend')
  end

  scenario "user visiting requested friend user profile" do
    login_as(@user)
    visit user_path(@requester)
    expect(page).to have_content("#{@requester.name}")
    expect(page).to have_content("#{@requester.email}")
    expect(page).to have_link('Overview')
    expect(page).to have_button('Accept request')
    expect(page).to have_button('Decline request')
  end

  scenario "user visiting random user profile" do
    login_as(@user)
    visit user_path(@random)
    expect(page).to have_text("There are no posts")
    expect(page).to have_content("#{@random.name}")
    expect(page).to have_content("#{@random.email}")
    expect(page).to have_link('Overview')
    expect(page).to have_button('Add friend')
  end
end
