require 'rails_helper'

RSpec.feature "VisitUsersIndices", type: :feature do
  before(:each) do
    @user = create(:user)
    login_as(@user, :scope => :user)
    @friend = create(:user)
    @random = create(:user)
    @random2 = create(:user)
    create(:friendship, sent_friend: @user, received_friend: @friend)
    create(:friend_request, requester: @user, requested: @random)
    create(:friend_request, requester: @random2, requested: @user)
  end

  it 'lists all the users' do
    visit '/users'
    expect(page).to have_content "#{@user.name}"
    expect(page).to have_content "#{@random.name}"
    expect(page).to have_content "#{@random2.name}"
    expect(page).to have_content "#{@friend.name}"
  end

  it 'lists all the buttons' do
    visit '/users'
    expect(page).to have_button('Request pending', disabled: true)
    expect(page).to have_button('Accept request')
    expect(page).to have_button("Add friend")
    # expect(page).to have_button('Unfriend')
  end
end
