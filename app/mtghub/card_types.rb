class CardTypes
  attr_reader :deck

  def initialize deck
    @deck = deck
    @land, @creature, @instant, @planeswalker = 0, 0, 0, 0
    @sorcery, @artifact, @enchantment = 0, 0, 0
  end

  def stats
    set_types
    [ {value: @land, color: '#F7464A', label: 'Land'},
      {value: @creature, color: '#E2EAE9', label: 'Creature'},
      {value: @instant, color: '#D4CCC5', label: 'Instant'},
      {value: @sorcery, color: '#949FB1', label: 'Sorcery'},
      {value: @artifact, color: '#4D5360', label: 'Artifact'},
      {value: @planeswalker, color: 'pink', label: 'Planeswalker'},
      {value: @enchantment, color: 'purple', label: 'Enchantment'} ]
  end

  def set_types
    types.each do |card|
      increment_types(card.downcase)
    end
  end

  def increment_types card
    if card.include? 'creature'
      @creature += 1
    elsif card.include? 'land'
      @land += 1
    elsif card.include? 'instant'
      @instant += 1
    elsif card.include? 'sorcery'
      @sorcery += 1
    elsif card.include? 'enchantment'
      @enchantment += 1
    elsif card.include? 'artifact'
      @artifact += 1
    elsif card.include? 'planeswalker'
      @planeswalker += 1
    end
  end

  def types
    @types ||= deck.cards.map(&:main_type)
  end
end
