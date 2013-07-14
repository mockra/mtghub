require_relative '../../app/mtghub/color_distribution'

describe ColorDistribution do
  let(:color_distribution) { ColorDistribution.new double(:deck) }

  describe '#stats' do
    let(:mana_costs) { [ [1, 'B'], ['U', 'R'] ] }

    it 'generates values for each color' do
      expect(color_distribution).to receive(:mana_costs) { mana_costs }
      expect(color_distribution.stats).to eq [
        {value: 0, color: "gray", label: "white"},
        {value: 1, color: "blue", label: "blue"},
        {value: 1, color: "black", label: "black"},
        {value: 1, color: "red", label: "red"},
        {value: 0, color: "green", label: "green"} ]
    end
  end
end
