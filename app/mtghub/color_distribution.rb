class ColorDistribution
  attr_reader :deck

  def initialize deck
    @deck = deck
    @W, @U, @B, @R, @G = 0, 0, 0, 0, 0
  end

  def stats
    set_mana_costs
    [ {value: @W, color: 'gray', label: 'white'},
      {value: @U, color: 'blue', label: 'blue'},
      {value: @B, color: 'black', label: 'black'},
      {value: @R, color: 'red', label: 'red'},
      {value: @G, color: 'green', label: 'green'} ]
  end

  def mana_costs
    @mana_costs ||= deck.cards.map(&:mana_cost)
  end

  def set_mana_costs
    mana_costs.each do |mana|
      increment_costs(mana)
    end
  end

  def increment_costs mana
    @W += 1 if mana.include?('W')
    @U += 1 if mana.include?('U')
    @B += 1 if mana.include?('B')
    @R += 1 if mana.include?('R')
    @G += 1 if mana.include?('G')
  end
end
