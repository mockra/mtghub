class DeckDecorator < Draper::Decorator
  delegate_all

  def mana_groups
    Hash[cards.reject(&:land?).group_by(&:cmc).sort]
  end

  def lands
    cards.select(&:land?)
  end
end
