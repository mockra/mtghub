require 'spec_helper'

describe ForksController do
  let(:deck) { create :deck }
  let(:user) { build :user }

  describe '#create' do
    before { controller.stub current_user: user }

    it 'creates a new fork for user' do
      deck
      expect{ post :create, fork: deck }.to change(Deck, :count).by 1
      expect(user.decks).to include assigns[:fork]
    end
  end
end
