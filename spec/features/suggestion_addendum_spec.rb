require 'spec_helper'

feature 'suggestions addendum' do
  let(:card) { create :card }
  let(:card_two) { create :card, title: 'card 2' }
  let(:deck) { create :deck, cards: [card, card, card_two] }
  let(:suggestion) { create :suggestion, additions: [card],
    deletions: [card_two], sideboard_additions: [card, card],
    sideboard_deletions: [card_two] }
  let(:user) { create :user }

  scenario 'updating a deck' do
    deck.sideboard.cards = [card_two, card_two]
    SuggestionAddendum.new(deck, suggestion).process
    deck.reload
    expect(deck.cards).to match_array [card, card, card]
    expect(deck.sideboard.cards).to match_array [card, card, card_two]
  end
end
