class DeckDecorator < Draper::Decorator
  delegate_all

  def mana_groups
    Hash[cards.group_by(&:cmc).sort]
  end
end
