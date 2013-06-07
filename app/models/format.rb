class Format < ActiveRecord::Base
  validates :title, presence: true

  def self.titles
    all.map(&:title)
  end
end
