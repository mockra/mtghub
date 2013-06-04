require 'spec_helper'

describe StarsController do
  let(:user) { create :user }
  let(:deck) { create :deck, user: user }
  before { controller.stub current_user: user }

  describe '#index' do
    it 'assigns all stars for a deck' do
      get :index, deck_id: deck
      expect(assigns[:stars]).to eq deck.stars
    end
  end

  describe '#create' do
    it 'creates a new star' do
      expect {
        post :create, deck_id: deck, format: :js
      }.to change(Star, :count).by 1
    end

    it 'does not create duplicates' do
      create :star, user: user, deck: deck
      expect {
        post :create, deck_id: deck, format: :js
      }.to change(Star, :count).by 0
    end
  end
end
