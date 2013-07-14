require_relative '../../app/mtghub/stats_widget'

class ColorDistribution; end
class Curve; end
class CardTypes; end

describe StatsWidget do
  let(:stats_widget) { StatsWidget.new double(:deck) }

  describe '#color_distribution' do
    it 'delegates to ColorDistribution' do
      expect(ColorDistribution).to receive(:new) { double stats: true }
      stats_widget.color_distribution
    end
  end

  describe '#curve' do
    it 'delegates to ColorDistribution' do
      expect(Curve).to receive(:new) { double stats: true }
      stats_widget.curve
    end
  end

  describe '#card_types' do
    it 'delegates to ColorDistribution' do
      expect(CardTypes).to receive(:new) { double stats: true }
      stats_widget.card_types
    end
  end
end
