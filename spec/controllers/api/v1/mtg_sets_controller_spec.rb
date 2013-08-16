require 'spec_helper'

describe Api::V1::MtgSetsController do
  let(:card) { create :card }
  let(:mtg_set) { create :mtg_set }

  describe '#show' do
    it 'returns json hash of set with cards' do
      mtg_set.cards << card
      get :show, id: mtg_set.title, format: :json
      json_response = JSON.parse(response.body)['mtg_sets'].first
      expect(json_response['title']).to eq mtg_set.title
      expect(json_response['code']).to eq mtg_set.code
      expect(json_response['cards'].first['title']).to eq card.title
    end
  end
end
