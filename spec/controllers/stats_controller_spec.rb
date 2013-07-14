require 'spec_helper'

describe StatsController do
  let(:deck) { create :deck }

  describe '#index' do
    before { deck }

    it 'assigns a deck' do
      get :index, deck_id: deck
      expect(assigns[:deck]).to eq deck
    end
  end
end
