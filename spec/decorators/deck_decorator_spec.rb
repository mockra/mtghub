require 'spec_helper'

describe DeckDecorator do
  let(:cards) { [Card.new(cmc: 4, main_type: 'land'),
    Card.new(cmc: 7, main_type: 'urn'), Card.new(cmc: 3, main_type: 'tap'),
    Card.new(cmc: 4, main_type: 'ape'), Card.new(cmc: 4, main_type: 'set')] }
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

    it 'rejects land cards' do
      expect(deck.mana_groups[4].count).to eq 2
    end
  end

  describe '#lands' do
    it 'selects all land cards' do
      expect(deck.lands.count).to eq 1
    end
  end

  describe '#land_groups' do
    it 'breaks lands into groups' do
      6.times do
        deck.cards << Card.new(main_type: 'land')
      end
      expect(deck.land_groups.count).to eq 2
      expect(deck.land_groups.first.count).to eq 5
      expect(deck.land_groups.last.count).to eq 2
    end
  end
end
