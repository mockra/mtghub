class SuggestionSideboardDeletion < ActiveRecord::Base
  belongs_to :suggestion
  belongs_to :card
end
