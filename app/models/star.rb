class Star < ActiveRecord::Base
  belongs_to :deck, counter_cache: true
  belongs_to :user
end
