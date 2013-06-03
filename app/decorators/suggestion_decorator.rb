class SuggestionDecorator < Draper::Decorator
  delegate_all

  def accept
    accept_link if h.authorized?(deck.user) and open?
  end

  def accept_link
    h.link_to 'Accept', h.deck_suggestion_path(deck, self), method: :patch
  end
end
