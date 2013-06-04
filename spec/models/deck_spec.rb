require 'spec_helper'

describe Deck do
  let(:deck) { create :deck, cards: [card] }
  let(:card) { build :card }

  it { should belong_to :user }
  it { should belong_to :origin }
  it { should have_many :forks }
  it { should have_many :suggestions }
  it { should have_many :comments }
  it { should have_many :stars }
  it { should validate_presence_of :title }
  it { should have_one :sideboard }

  describe '#cards' do
    it 'has cards' do
      expect(deck.cards).to eq [card]
    end
  end

  describe '#sideboard_cards' do
    it 'returns card array from sideboard' do
      deck.sideboard = Sideboard.new cards: [card]
      expect(deck.sideboard_cards).to eq [card]
    end

    it 'creates a sideboard if one does not exist' do
      expect { deck.sideboard_cards }.to change(Sideboard, :count).by 1
    end
  end
end
