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
    h.content_tag :li do
      h.link_to h.edit_user_deck_path(user, self) do
        h.content_tag 'i', ' Edit', class: 'icon-edit'
      end
    end
  end

  def suggest
    suggest_link if origin && h.authorized?(user)
  end

  def suggest_link
    h.content_tag :li do
      h.link_to h.new_deck_suggestion_path(self), class: 'suggest' do
        h.content_tag 'i', ' Suggest', class: 'icon-upload'
      end
    end
  end

  def fork
    fork_link if !h.authorized?(user)
  end

  def fork_link
    h.content_tag :li do
      h.link_to h.forks_url(fork: self), class: 'fork', method: :post do
        h.content_tag 'i', ' Copy', class: 'icon-copy'
      end
    end
  end

  def stars_link
    h.content_tag :li, class: "stars-post #{starred?}" do
      h.link_to h.deck_stars_path(self), remote: true, method: :post,
        class: 'stars-post-link' do
        h.content_tag 'i', " #{stars.count}", class: 'icon-star'
      end
    end
  end

  def starred?
    if h.current_user && stars.find_by_user_id(h.current_user.id)
      'active'
    end
  end
end
