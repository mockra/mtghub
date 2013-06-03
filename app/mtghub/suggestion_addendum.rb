class SuggestionAddendum
  attr_accessor :deck, :suggestion

  def initialize deck, suggestion
    @deck, @suggestion = deck, suggestion
  end

  def process
    update_cards
    update_sideboard_cards
  end

  def update_cards
    suggestion.deletions.each { |x| delete_card_from_deck(x) }
    deck.cards << suggestion.additions
  end

  def update_sideboard_cards
    suggestion.sideboard_deletions.each { |x| delete_card_from_sideboard(x) }
    deck.sideboard.cards << suggestion.sideboard_additions
  end

  def delete_card_from_deck del
    card = cards_deck.where(card_id: del, deck_id: deck).first
    card.destroy if card
  end

  def delete_card_from_sideboard del
    card = cards_sideboard.where(card_id: del, sideboard_id: deck.sideboard).first
    card.destroy if card
  end

  def cards_deck
    CardsDeck
  end

  def cards_sideboard
    CardsSideboard
  end
end
