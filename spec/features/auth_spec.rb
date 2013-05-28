require 'spec_helper'
require 'vcr_config'

feature 'sessions' do
  let(:user) { create :user }

  before { sign_in user }

  scenario 'signing in' do
    expect(page).to have_content user.username.humanize
  end

  scenario 'signing out', js: true do
    find('i.icon-signout').click
    expect(page).to_not have_content user.username.humanize
  end
end
