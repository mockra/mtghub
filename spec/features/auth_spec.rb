require 'spec_helper'

feature 'sessions' do
  let(:user) { create :user }

  before { sign_in user }

  scenario 'signing in' do
    expect(page).to have_content user.username.humanize
  end

  scenario 'signing out' do
    click_link 'Sign Out'
    expect(page).to_not have_content user.username.humanize
  end
end
