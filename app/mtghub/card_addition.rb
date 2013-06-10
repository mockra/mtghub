class CardAddition
  attr_reader :set, :card_hash

  def initialize set, card_hash
    @set, @card_hash = set, card_hash
  end

  def create
    card = mtg_set.cards.create card_hash
    CardImageAddition.new(card).process
  end

  def mtg_set
    @mtg_set ||= MtgSet.find_by_title set
  end
end
