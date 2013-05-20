class DeckDecorator < Draper::Decorator
  delegate_all

  def mana_groups
    Hash[cards.reject(&:land?).group_by(&:cmc).sort]
  end

  def lands
    cards.select(&:land?)
  end

  def land_groups
    lands.each_slice(5).to_a
  end

  def sideboard_groups
    sideboard ? sideboard.cards.each_slice(5).to_a : [[]]
  end
end
