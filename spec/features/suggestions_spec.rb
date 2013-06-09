require 'spec_helper'

feature 'suggestions' do
  let(:deck) { create :deck, user: user_two }
  let(:fork) { create :deck, origin: deck, user: user }
  let(:user) { create :user }
  let(:user_two) { create :user }

  before { sign_in user }
  before do
    visit user_deck_path(user, fork)
    find('a.suggest').click
    fill_in 'suggestion_title', with: 'test'
    click_button 'Create Suggestion'
  end

  scenario 'creating a new suggestion' do
    expect(deck.suggestions.first.title).to eq 'test'
  end

  scenario 'viewing a list of suggestions' do
    visit user_deck_path(deck.user, deck)
    click_link 'Suggestions'
    expect(page).to have_content 'test'
  end

  scenario 'accepting a suggestion' do
    sign_in user_two
    visit user_deck_path(deck.user, deck)
    click_link 'Suggestions'
    find('a', text: 'test').click
    click_link 'Accept'
    expect(deck.suggestions.first.open?).to be_false
  end

  scenario 'closing a suggestion' do
    sign_in user
    visit user_deck_path(deck.user, deck)
    click_link 'Suggestions'
    find('a', text: 'test').click
    click_link 'Close'
    expect(deck.suggestions.first.open?).to be_false
  end
end
