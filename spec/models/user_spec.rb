require 'spec_helper'

describe User do
  it { should have_many :decks }
  it { should have_many :suggestions }
  it { should have_many :comments }
  it { should have_many :stars }
  it { should validate_presence_of :password }
  it { should validate_presence_of :email }
  it { should validate_presence_of :username }
  it { should_not allow_value('blah').for :email }
  it { should allow_value('a@b.com').for :email }
end
