class CreateCardsDecks < ActiveRecord::Migration
  def change
    create_table :cards_decks do |t|
      t.references :card
      t.references :deck
    end
  end
end
