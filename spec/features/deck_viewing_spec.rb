require 'spec_helper'
require 'vcr_config'

feature 'deck viewing' do
  let(:user) { create :user }
  let(:card) { create :card }
  let(:deck) { create :deck, user: user, cards: [card, card] }

  scenario 'viewing a deck' do
    visit user_deck_path(user, deck)
    expect(page).to have_content card.image_url
  end
end
