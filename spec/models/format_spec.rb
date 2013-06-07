require 'spec_helper'

describe Format do
  it { should validate_presence_of :title }

  describe '.titles' do
    let(:format) { create :format }

    it 'returns an array of format titles' do
      format
      expect(Format.titles).to eq [format.title]
    end
  end
end
