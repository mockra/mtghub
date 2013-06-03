require 'spec_helper'

describe SuggestionDecorator do
  let(:deck) { create :deck }
  let(:user) { create :user }
  let(:suggestion) { Suggestion.new(deck: deck, user: user).decorate }

  describe '#accept' do
    before { helpers.stub 'authorized?' => true }
    before { suggestion.stub 'open?' => true }

    it 'returns accept link' do
      expect(suggestion.accept).to include 'Accept'
    end

    it 'only shows link for authorized users' do
      helpers.stub 'authorized?' => false
      expect(suggestion.accept).to be_nil
    end

    it 'only shows link for if open' do
      suggestion.stub 'open?' => false
      expect(suggestion.accept).to be_nil
    end
  end
end
