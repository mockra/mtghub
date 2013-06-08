class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :forks, class_name: 'Deck', foreign_key: 'origin_id'
  belongs_to :origin, class_name: 'Deck'
  has_many :cards_decks
  has_many :cards, through: :cards_decks, dependent: :destroy
  has_one :sideboard, dependent: :destroy
  has_many :suggestions, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :stars, dependent: :destroy

  validates :title, presence: true

  before_create :create_sideboard

  scope :for_format, lambda { |x| order('updated_at desc').where(format: x).limit(5) }

  def sideboard_cards
    sideboard ? sideboard.cards : create_sideboard.cards
  end

  def sideboard_cards= cards
    create_sideboard if !sideboard
    sideboard.cards = cards
  end
end
