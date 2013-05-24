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

  scenario 'authorized user can see edit link' do
    sign_in user
    visit user_deck_path(user, deck)
    expect(page).to have_css 'i.icon-edit'
  end

  scenario 'unauthorized user can not see edit link' do
    visit user_deck_path(user, deck)
    expect(page).to_not have_css 'i.icon-edit'
  end
end
