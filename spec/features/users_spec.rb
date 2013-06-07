require 'spec_helper'

feature 'users' do
  let(:user) { create :user }
  let(:deck) { create :deck, user: user }

  scenario 'viewing a user page' do
    deck
    visit user_path(user)
    expect(page).to have_content user.username
    expect(page).to have_content deck.title
  end
end
