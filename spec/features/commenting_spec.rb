require 'spec_helper'
require 'vcr_config'

feature 'commenting', js: true do
  let(:user) { create :user }
  let(:deck) { create :deck }
  let(:suggestion) { create :suggestion }

  before { sign_in user }

  scenario 'decks' do
    visit user_deck_comments_path(deck.user, deck)
    fill_in 'comment_content', with: 'test comment'
    click_button 'Comment'
    find('.comment', text: 'test comment')
  end

  scenario 'suggestions' do
    visit deck_suggestion_path(suggestion.deck, suggestion)
    fill_in 'comment_content', with: 'test comment'
    click_button 'Comment'
    find('.comment', text: 'test comment')
  end
end
