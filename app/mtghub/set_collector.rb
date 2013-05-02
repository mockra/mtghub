class SetCollector
  attr_reader :set

  def initialize set
    @set = set
  end

  def parsed_cards
    @parsed_cards ||= GathererSetParser::Fetch.new(set).cards
  end

  def cards
    parsed_cards.map { |card| card_hash(card) }
  end

  def card_hash card
    { title: card[:title],
    main_type: card[:card_type],
    sub_type: card[:sub_type],
    power: card[:power],
    toughness: card[:toughness],
    cmc: card[:cmc],
    mana_cost: card[:mana_cost],
    loyalty: card[:loyalty],
    image_url: card[:image_url],
    description: card[:text],
    gatherer_url: card[:gatherer_url],
    rarity: card[:rarity] }
  end
end
