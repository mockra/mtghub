require 'spec_helper'

describe DeckDecorator do
  let(:cards) { [Card.new(cmc: 4), Card.new(cmc: 7), Card.new(cmc: 3),
    Card.new(cmc: 4)] }
  let(:deck) { Deck.new(cards: cards).decorate }

  describe '#mana_groups' do
    it 'groups cards by cmc' do
      expect(deck.mana_groups.count).to eq 3
      expect(deck.mana_groups[3].count).to eq 1
      expect(deck.mana_groups[4].count).to eq 2
      expect(deck.mana_groups[7].count).to eq 1
    end

    it 'sorts hash by keys' do
      expect(deck.mana_groups.keys).to eq [3, 4, 7]
    end
  end
end
