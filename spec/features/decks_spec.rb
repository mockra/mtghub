require 'spec_helper'

feature 'decks' do
  let(:format) { create :format }
  let(:deck) { create :deck, format: format.title }

  scenario 'viewing list of decks' do
    deck
    visit decks_path
    expect(page).to have_content format.title
    expect(page).to have_content deck.title
  end
end
