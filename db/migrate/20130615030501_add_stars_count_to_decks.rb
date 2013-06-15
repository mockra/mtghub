class AddStarsCountToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :stars_count, :integer, default: 0
  end
end
