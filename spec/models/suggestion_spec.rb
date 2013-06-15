require 'spec_helper'

describe Suggestion do
  let(:suggestion) { create :suggestion }
  let(:card) { create :card }

  it { should belong_to :user }
  it { should belong_to :deck }
  it { should have_many :comments }

  it { should validate_presence_of :title }

  describe '#additions and deletions' do
    it 'has many cards' do
      cases = %w[additions deletions sideboard_deletions sideboard_additions]
      cases.each do |msg|
        suggestion.send(msg) << card
        expect(suggestion.send(msg)).to eq [card]
      end
    end
  end

  describe '#close' do
    it 'updates open to false' do
      expect(suggestion.open).to be_true
      suggestion.close
      expect(suggestion.open).to be_false
    end
  end
end
