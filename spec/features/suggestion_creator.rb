require 'spec_helper'

feature 'suggestion creator' do
  let(:card) { create :card }
  let(:card_two) { create :card, title: 'two' }
  let(:card_three) { create :card, title: 'three' }
  let(:user) { create :user }
  let(:deck) { create :deck, user: user, cards: [card, card_three] }
  let(:origin) { create :deck, cards: [card, card, card_two] }
  let(:creator) { SuggestionCreator.new user, deck, origin }

  before do
    deck.stub_chain(:sideboard, :cards) { [card, card_two] }
    origin.stub_chain(:sideboard, :cards) { [card_two, card_two, card_three] }
  end

  scenario 'creating a new suggestion' do
    expect{ creator.process }.to change(Suggestion, :count).by 1
    suggestion = user.suggestions.first
    expect(suggestion.additions).to eq [card_three]
    expect(suggestion.deletions).to eq [card, card_two]
    expect(suggestion.sideboard_additions).to eq [card]
    expect(suggestion.sideboard_deletions).to eq [card_two, card_three]
  end
end
