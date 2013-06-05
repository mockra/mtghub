require 'spec_helper'

feature 'forking' do
  let(:user) { create :user }
  let(:card) { create :card }
  let(:deck) { create :deck, user: user, cards: [card, card] }

  before { sign_in user }

  scenario 'users can fork other decks' do
    deck.update_attribute :user, build(:user)
    visit user_deck_path(user, deck)
    find('button.fork').click
    fork = user.decks.first
    expect(current_path).to eq edit_user_deck_path(user, fork)
    expect(fork.title).to eq deck.title
    expect(fork.cards).to eq deck.cards
    expect(fork.origin).to eq deck
  end

  scenario 'user should not see fork link on their own decks' do
    visit user_deck_path(user, deck)
    expect(page).to_not have_content 'Fork'
  end
end
