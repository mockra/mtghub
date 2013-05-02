class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :forks, class_name: 'Deck', foreign_key: 'origin_id'
  belongs_to :origin, class_name: 'Deck'
  has_many :cards_decks
  has_many :cards, through: :cards_decks
  has_one :sideboard

  validates :title, presence: true
end
