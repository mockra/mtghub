require 'spec_helper'
require 'vcr_config'

feature 'sessions' do
  let(:user) { create :user }

  before { sign_in user }

  scenario 'signing in' do
    expect(page).to have_css 'a.profile'
  end

  scenario 'signing out', js: true do
    find('i.icon-off').click
    expect(page).to_not have_css 'a.profile'
  end
end
