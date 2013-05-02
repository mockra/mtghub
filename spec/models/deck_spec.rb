require 'spec_helper'

describe Deck do
  let(:deck) { create :deck, cards: [card] }
  let(:card) { create :card }

  it { should belong_to :user }
  it { should belong_to :origin }
  it { should have_many :forks }
  it { should validate_presence_of :title }
  it { should have_one :sideboard }

  describe '#cards' do
    it 'has cards' do
      expect(deck.cards).to eq [card]
    end
  end
end
