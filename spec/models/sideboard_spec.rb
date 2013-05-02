require 'spec_helper'

describe Sideboard do
  let(:sideboard) { create :sideboard, cards: [card] }
  let(:card) { create :card }

  it { should belong_to :deck }
  it { should validate_presence_of :deck_id }

  describe '#cards' do
    it 'has cards' do
      expect(sideboard.cards).to eq [card]
    end
  end
end
