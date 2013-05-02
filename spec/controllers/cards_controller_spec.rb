require 'spec_helper'

describe CardsController do
  let(:user) { create :user }
  let(:card) { create :card }
  let(:deck) { create :deck, cards: [card], user: user }
  before { controller.stub current_user: user }

  describe '#create' do
    it 'adds a card to the deck' do
      post :create, deck_id: deck, id: card, format: :js
      expect(deck.cards.count).to eq 2
    end
  end

  describe '#destroy' do
    it 'deletes the card from deck' do
      delete :destroy, deck_id: deck, id: card, format: :js
      expect(deck.cards.count).to eq 0
    end

    it 'only removes one instance' do
      deck.cards << card
      deck.save
      delete :destroy, deck_id: deck, id: card, format: :js
      expect(deck.cards.count).to eq 1
    end
  end
end
