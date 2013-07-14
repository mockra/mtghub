require_relative '../../app/mtghub/card_types'

describe CardTypes do
  let(:card_types) { CardTypes.new double(:deck) }

  describe '#stats' do
    let(:types) { %w[creature land land instant] }

    it 'generates values for each color' do
      expect(card_types).to receive(:types) { types }
      expect(card_types.stats).to eq(
        [ {:value=>2, :color=>"#F7464A", :label=>"Land"},
          {:value=>1, :color=>"#E2EAE9", :label=>"Creature"},
          {:value=>1, :color=>"#D4CCC5", :label=>"Instant"},
          {:value=>0, :color=>"#949FB1", :label=>"Sorcery"},
          {:value=>0, :color=>"#4D5360", :label=>"Artifact"},
          {:value=>0, :color=>"pink", :label=>"Planeswalker"},
          {:value=>0, :color=>"purple", :label=>"Enchantment"} ])
    end
  end
end
