require 'spec_helper'
require 'vcr_config'

feature 'stars' do
  let(:user) { create :user }
  let(:deck) { create :deck }

  before { sign_in user }

  scenario 'users can star a deck', js: true do
    visit user_deck_path(deck.user, deck)
    find('a.stars-post-link').click
    find('li.active')
    visit deck_stars_path(deck)
    expect(page).to have_content user.username
  end
end
