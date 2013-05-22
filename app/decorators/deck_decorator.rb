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
    sideboard ? sideboard.cards.each_slice(5).to_a : [[]]
  end

  def edit
    edit_link if h.authorized?(user)
  end

  def edit_link
    h.link_to h.edit_user_deck_path(user, self) do
      h.content_tag 'i', nil, class: 'icon-edit-sign'
    end
  end
end
