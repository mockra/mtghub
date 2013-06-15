require 'spec_helper'
require 'vcr_config'

feature 'users' do
  let(:user) { create :user }
  let(:deck) { create :deck, user: user }

  scenario 'viewing a user page' do
    deck
    visit user_path(user)
    expect(page).to have_content user.username
    expect(page).to have_content deck.title
  end

  scenario 'editing your settings' do
    sign_in user
    visit edit_user_path(user)
    fill_in 'user_username', with: 'update'
    fill_in 'user_password', with: 'update'
    click_button 'Save'
    expect(page).to have_content 'update'
  end

  scenario 'deleting your account' do
    sign_in user
    expect {
      visit edit_user_path(user)
      click_link 'Delete Account'
      expect(current_path).to eq root_path
    }.to change(User, :count).by -1
  end
end
