class Suggestion < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user

  has_many :suggestion_additions, dependent: :destroy
  has_many :additions, through: :suggestion_additions, source: :card

  has_many :suggestion_deletions, dependent: :destroy
  has_many :deletions, through: :suggestion_deletions, source: :card

  has_many :suggestion_sideboard_additions, dependent: :destroy
  has_many :sideboard_additions, through: :suggestion_sideboard_additions,
    source: :card

  has_many :suggestion_sideboard_deletions, dependent: :destroy
  has_many :sideboard_deletions, through: :suggestion_sideboard_deletions,
    source: :card

  def close
    update_attribute :open, false
  end
end
