class Card < ActiveRecord::Base
  belongs_to :mtg_set
  has_many :decks, through: :cards_decks
  has_many :cards_sideboards
  has_many :cards_decks
  has_many :sideboards, through: :cards_sideboards

  has_many :suggestion_additions, dependent: :destroy
  has_many :suggestion_deletions, dependent: :destroy
  has_many :suggestion_sideboard_additions, dependent: :destroy
  has_many :suggestion_sideboard_deletions, dependent: :destroy

  def land?
    main_type =~ /land/i
  end
end
