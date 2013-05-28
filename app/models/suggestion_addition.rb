class SuggestionAddition < ActiveRecord::Base
  belongs_to :suggestion
  belongs_to :card
end
