require_relative '../../app/mtghub/suggestion_addendum'

describe SuggestionAddendum do
  let(:deck) { double(:deck) }
  let(:suggestion) { double(:suggestion) }
  let(:addendum) { SuggestionAddendum.new deck, suggestion }

  describe '#process' do
    before { suggestion.stub additions: [], deletions: [1] }
    before { suggestion.stub sideboard_deletions: [2], sideboard_additions: [] }

    it 'adds suggestions to deck' do
      addendum.stub_chain(:cards_deck, :where, :first).
        and_return(double destroy: true)
      addendum.stub_chain(:cards_sideboard, :where, :first).
        and_return(double destroy: true)
      expect(deck).to receive(:cards).and_return([])
      expect(deck).to receive(:sideboard).twice.and_return(double cards: [])
      addendum.process
    end
  end
end
