require 'spec_helper'

describe Card do
  let(:card) { create :card }

  it { should belong_to :mtg_set }

  describe '#decks' do
    let(:deck) { create :deck, cards: [card] }

    it 'has and belongs to decks' do
      expect(card.decks).to eq [deck]
      expect(deck.cards).to eq [card]
    end
  end

  describe '#sideboards' do
    let(:sideboard) { create :sideboard, cards: [card] }

    it 'has and belongs to sideboards' do
      expect(card.sideboards).to eq [sideboard]
      expect(sideboard.cards).to eq [card]
    end
  end
end
