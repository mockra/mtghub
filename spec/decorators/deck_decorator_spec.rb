require 'spec_helper'

describe DeckDecorator do
  let(:cards) { [Card.new(cmc: 4, main_type: 'land'),
    Card.new(cmc: 7, main_type: 'urn'), Card.new(cmc: 3, main_type: 'tap'),
    Card.new(cmc: 4, main_type: 'ape'), Card.new(cmc: 4, main_type: 'set')] }
  let(:sideboard) { create :sideboard }
  let(:deck) { Deck.new(cards: cards, sideboard: sideboard).decorate }

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

  describe '#sideboard_groups' do
    it 'breaks sideboard.cards into groups' do
      deck.sideboard.cards = cards + [build(:card)]
      expect(deck.sideboard_groups.count).to eq 2
      expect(deck.sideboard_groups.first.count).to eq 5
      expect(deck.sideboard_groups.last.count).to eq 1
    end

    it 'returns empty nested array if no sideboard' do
      deck.sideboard = nil
      expect(deck.sideboard_groups).to eq [[]]
    end
  end

  describe '#edit' do
    it 'shows edit_link if user is authorized' do
      helpers.stub 'authorized?' => true
      deck.should_receive :edit_link
      deck.edit
    end

    it 'does not show edit_link if user is not authorized' do
      helpers.stub 'authorized?' => false
      deck.should_not_receive :edit_link
      deck.edit
    end
  end

  describe '#edit_link' do
    it 'creates a link to deck_edit' do
      expect(deck.edit_link).to include
        helpers.edit_user_deck_path(deck.user, deck)
    end
  end
end
