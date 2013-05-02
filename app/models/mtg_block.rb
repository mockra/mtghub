class MtgBlock < ActiveRecord::Base
  has_many :mtg_sets
  validates :title, presence: true
end
