require 'spec_helper'
require 'vcr_config'

feature 'set generation', :vcr do
  let(:mtg_set) { MtgSet.create title: 'Return to Ravnica', code: 'RTR' }

  before do
    CardsFromSet.new(mtg_set.title).generate
  end

  scenario 'fetches cards from the gatherer website' do
    expect(Card.first.title).to eq 'Abrupt Decay'
    expect(Card.first.main_type).to eq 'Instant'
    expect(Card.first.sub_type).to be_nil
    expect(Card.first.power).to be_nil
    expect(Card.first.toughness).to be_nil
    expect(Card.first.cmc).to eq 2
    expect(Card.first.mana_cost).to eq ['B', 'G']
    expect(Card.first.loyalty).to be_nil
    expect(Card.first.image_url).to include 'multiverseid=253561&type=card'
    expect(Card.first.description).to include 'countered by spells'
    expect(Card.first.gatherer_url).to include 'tails.aspx?multiverseid=253561'
    expect(Card.first.rarity).to eq 'Rare'
    expect(Card.first.mtg_set).to eq mtg_set
  end

  scenario 'creates a card in the database' do
    expect(Card.count).to eq 254
  end
end
