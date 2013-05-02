require 'spec_helper'

describe MtgSetsController do
  let(:mtg_set) { create :mtg_set }

  describe '#show' do
    it 'loads a given set' do
      get :show, id: mtg_set, format: :js
      expect(assigns[:mtg_set]).to eq mtg_set
    end
  end
end
