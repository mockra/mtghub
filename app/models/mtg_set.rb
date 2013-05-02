class MtgSet < ActiveRecord::Base
  belongs_to :mtg_block
  has_many :cards, dependent: :destroy

  validates :title, presence: true
  validates :code, presence: true
end
