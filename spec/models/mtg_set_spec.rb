require 'spec_helper'

describe MtgSet do
  it { should belong_to :mtg_block }
  it { should have_many :cards }
  it { should validate_presence_of :title }
  it { should validate_presence_of :code }
end
