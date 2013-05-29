require_relative '../../app/mtghub/suggestion_creator'

describe SuggestionCreator do
  let(:user) { double(:user) }
  let(:deck) { double(:deck) }
  let(:origin) { double(:origin) }
  let(:suggestion) { double(:suggestion) }
  let(:creator) { SuggestionCreator.new user, deck, origin }

  describe '#process' do
    before { user.stub_chain(:suggestions, :build) { suggestion } }
    before { creator.stub deck_diff: stub(additions: [], deletions: []) }
    before { creator.stub sideboard_diff: stub(additions: [], deletions: []) }

    it 'adds differences to suggestion' do
      suggestion.should_receive(:additions=)
      suggestion.should_receive(:deletions=)
      suggestion.should_receive(:sideboard_additions=)
      suggestion.should_receive(:sideboard_deletions=)
      creator.process
    end
  end
end
