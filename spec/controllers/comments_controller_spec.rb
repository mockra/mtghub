require 'spec_helper'

describe CommentsController do
  let(:deck) { create :deck }
  let(:suggestion) { create :suggestion }

  describe '#create' do
    it 'creates a comment for decks' do
      expect {
        post :create, deck_id: deck, comment: { content: 'test' }, format: :js
      }.to change(Deck, :count).by 1
    end

    it 'creates a comment for suggestions' do
      expect {
        post :create, suggestion_id: suggestion, comment: { content: 'test' },
          format: :js
      }.to change(Deck, :count).by 1
    end
  end
end
