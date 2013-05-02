class Sideboard < ActiveRecord::Base
  belongs_to :deck
  validates :deck_id, presence: true
  has_many :cards_sideboards
  has_many :cards, through: :cards_sideboards
end
