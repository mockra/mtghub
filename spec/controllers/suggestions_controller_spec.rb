require 'spec_helper'

describe SuggestionsController do
  let(:origin) { create :deck }
  let(:card) { create :card }
  let(:deck) { create :deck, origin: origin, cards: [card] }
  let(:user) { create :user }

  before { controller.stub current_user: user }

  describe '#new' do
    it 'assigns a new suggestion' do
      get :new, deck_id: deck
      expect(assigns[:suggestion]).to be_a Suggestion
    end

    it 'assigns additions and deletions' do
      get :new, deck_id: deck
      expect(assigns[:suggestion].deletions).to eq []
      expect(assigns[:suggestion].additions).to eq [card]
    end
  end

  describe '#create' do
    it 'persists a new suggestion' do
      expect {
        post :create, deck_id: deck, suggestion: { title: ''}
      }.to change(Suggestion, :count).by 1
    end

    it 'redirects to suggestion' do
      post :create, deck_id: deck, suggestion: { title: '' }
      expect(response).to redirect_to [deck.origin, assigns[:suggestion]]
    end

    it 'assigns new attributes' do
      post :create, deck_id: deck, suggestion: { title: 'test' }
      expect(assigns[:suggestion].title).to eq 'test'
    end
  end

  describe '#show' do
    let(:suggestion) { create :suggestion, deck: deck }

    it 'assigns a suggestion' do
      get :show, deck_id: deck, id: suggestion
      expect(assigns[:suggestion]).to eq suggestion
    end
  end
end
