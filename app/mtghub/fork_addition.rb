class ForkAddition
  attr_accessor :user, :deck

  def initialize user, deck
    @user, @deck = user, deck
  end

  def create
    create_associations
    new_deck.save
    new_deck
  end

  def new_deck
    @new_deck ||= deck.dup
  end

  def create_associations
    new_deck.user = user
    new_deck.origin = deck
    new_deck.cards = deck.cards
    new_deck.sideboard_cards = deck.sideboard_cards
  end
end
