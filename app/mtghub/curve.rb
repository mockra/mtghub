class Curve
  attr_reader :deck

  def initialize deck
    @deck = deck
  end

  def stats
    {
      labels: labels,
      datasets: [
        {
        fillColor: "rgba(220,220,220,0.5)",
        strokeColor: "rgba(220,220,220,1)",
        data: values
        }
      ]
    }
  end

  def data
  end

  def labels
    Hash[cmcs.group_by{|i| i}.sort].keys.map(&:to_s)
  end

  def values
    Hash[cmcs.group_by{|i| i}.sort].values.map(&:count)
  end

  def cmcs
    @cmcs ||= deck.non_lands.map(&:cmc)
  end
end
