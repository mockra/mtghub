class StatsWidget
  attr_reader :deck

  def initialize deck
    @deck = deck
  end

  def color_distribution
    ColorDistribution.new(deck).stats
  end

  def curve
    Curve.new(deck).stats
  end

  def card_types
    CardTypes.new(deck).stats
  end
end
