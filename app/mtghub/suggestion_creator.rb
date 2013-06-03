class SuggestionCreator
  attr_accessor :user, :deck, :origin

  def initialize user, deck, origin
    @user, @deck, @origin = user, deck, origin
  end

  def process
    add_differences
    suggestion
  end

  def add_differences
    suggestion.additions = deck_diff.additions
    suggestion.deletions = deck_diff.deletions
    suggestion.sideboard_additions = sideboard_diff.additions
    suggestion.sideboard_deletions = sideboard_diff.deletions
  end

  def suggestion
    @suggestion ||= user.suggestions.build deck: origin
  end

  def deck_diff
    @deck_diff ||= ArrayDiff.new origin.cards, deck.cards
  end

  def sideboard_diff
    @sideboard_diff ||=
      ArrayDiff.new origin.sideboard.cards, deck.sideboard.cards
  end
end
