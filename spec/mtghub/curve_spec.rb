require_relative '../../app/mtghub/curve'

describe Curve do
  let(:curve) { Curve.new double(:deck) }

  describe '#stats' do
    let(:cmcs) { %i[1 2 2 3 7 7 1 6 6] }

    it 'generates values for each color' do
      expect(curve).to receive(:cmcs).twice { cmcs }
      expect(curve.stats).to eq datasets: [
          { fillColor: "rgba(220,220,220,0.5)",
            strokeColor: "rgba(220,220,220,1)",
            data: [2, 2, 1, 2, 2] } ],
        labels: ["1", "2", "3", "6", "7"]
    end
  end
end
