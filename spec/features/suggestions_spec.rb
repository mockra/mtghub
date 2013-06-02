require 'spec_helper'

feature 'suggestions' do
  let(:deck) { create :deck }
  let(:fork) { create :deck, origin: deck, user: user }
  let(:user) { create :user }

  before { sign_in user }

  scenario 'creating a new suggestion' do
    visit user_deck_path(user, fork)
    click_link 'Suggest Changes'
    fill_in 'suggestion_title', with: 'test'
    click_button 'Create Suggestion'
    expect(deck.suggestions.first.title).to eq 'test'
  end

  scenario 'viewing a list of suggestions' do
    visit user_deck_path(user, fork)
    click_link 'Suggest Changes'
    fill_in 'suggestion_title', with: 'test'
    click_button 'Create Suggestion'
    visit user_deck_path(deck.user, deck)
    click_link 'Suggestions'
    expect(page).to have_content 'test'
  end
end
