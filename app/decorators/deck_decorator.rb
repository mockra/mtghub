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
    sideboard_cards.each_slice(5).to_a
  end

  def edit
    edit_link if h.authorized?(user)
  end

  def edit_link
    h.link_to h.edit_user_deck_path(user, self) do
      h.content_tag 'i', nil, class: 'icon-edit icon-2x'
    end
  end

  def suggest
    suggest_link if origin && h.authorized?(user)
  end

  def suggest_link
    h.link_to 'Suggest Changes', h.new_suggestion_path(deck_id: self)
  end

  def fork
    fork_link if !h.authorized?(user)
  end

  def fork_link
    h.link_to 'Fork', h.forks_url(fork: self), method: :post
  end
end
