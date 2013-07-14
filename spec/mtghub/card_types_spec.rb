require_relative '../../app/mtghub/card_types'

describe CardTypes do
  let(:card_types) { CardTypes.new double(:deck) }

  describe '#stats' do
    let(:types) { %w[creature land land instant] }

    it 'generates values for each color' do
      expect(card_types).to receive(:types) { types }
      expect(card_types.stats).to eq(
      [{:value=>2, :color=>"green", :label=>"Land"},
       {:value=>1, :color=>"blue", :label=>"Creature"},
       {:value=>1, :color=>"black", :label=>"Instant", :labelColor=>"white"},
       {:value=>0, :color=>"red", :label=>"Sorcery"},
       {:value=>0, :color=>"gray", :label=>"Artifact"},
       {:value=>0, :color=>"gray", :label=>"Planeswalker"},
       {:value=>0, :color=>"purple", :label=>"Enchantment"}])
    end
  end
end
