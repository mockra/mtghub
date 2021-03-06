require 'spec_helper'
require 'vcr_config'

feature 'deck editing' do
  let(:user) { create :user }
  let(:deck) { create :deck, user: user }
  let(:card) { create :card, title: 'Abrupt Decay' }

  before { sign_in user }

  pending 'adding a card to deck', js: true do
    card
    visit edit_user_deck_path(user, deck)
    click_link card.mtg_set.title
    find('li.card', text: card.title).click
    find('.card img')
    expect(deck.cards.count).to eq 1
  end
end
