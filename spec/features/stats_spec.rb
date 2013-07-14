require 'spec_helper'

feature 'stars' do
  let(:deck) { create :deck }

  scenario 'a deck has stats' do
    visit deck_stats_path(deck)
    expect(page).to have_content 'Card Types'
  end
end
