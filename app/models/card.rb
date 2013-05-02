class Card < ActiveRecord::Base
  belongs_to :mtg_set
  has_many :decks, through: :cards_decks
  has_many :cards_sideboards
  has_many :cards_decks
  has_many :sideboards, through: :cards_sideboards
end
