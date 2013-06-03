require_relative '../../app/mtghub/suggestion_creator'

describe SuggestionCreator do
  let(:user) { double(:user) }
  let(:deck) { double(:deck) }
  let(:origin) { double(:origin) }
  let(:suggestion) { double(:suggestion) }
  let(:creator) { SuggestionCreator.new user, deck, origin }

  describe '#process' do
    before { user.stub_chain(:suggestions, :build) { suggestion } }
    before { creator.stub deck_diff: double(additions: [], deletions: []) }
    before { creator.stub sideboard_diff: double(additions: [], deletions: []) }

    it 'adds differences to suggestion' do
      expect(suggestion).to receive(:additions=)
      expect(suggestion).to receive(:deletions=)
      expect(suggestion).to receive(:sideboard_additions=)
      expect(suggestion).to receive(:sideboard_deletions=)
      creator.process
    end
  end
end
