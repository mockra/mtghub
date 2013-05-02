class CardsSideboard < ActiveRecord::Base
  belongs_to :card
  belongs_to :sideboard
end
