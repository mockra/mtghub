require 'spec_helper'

describe ApplicationHelper do
  let(:user) { build :user }
  let(:helper) { Object.new.extend ApplicationHelper }

  describe '#authorized?' do
    it 'returns true if user parameter is the current_user' do
      helper.stub current_user: user
      expect(helper.authorized? user).to be_true
    end

    it 'returns false when user parameter is not the current_user' do
      helper.stub current_user: nil
      expect(helper.authorized? user).to be_false
    end
  end
end
