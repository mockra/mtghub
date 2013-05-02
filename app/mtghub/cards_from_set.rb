class CardsFromSet
  attr_reader :set

  def initialize set
    @set = set
  end

  def generate
    cards.each do |card_hash|
      CardAddition.new(set, card_hash).create
    end
  end

  def cards
    SetCollector.new(set).cards
  end
end
