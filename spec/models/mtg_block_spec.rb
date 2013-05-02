require 'spec_helper'

describe MtgBlock do
  it { should have_many :mtg_sets }
  it { should validate_presence_of :title }
end
