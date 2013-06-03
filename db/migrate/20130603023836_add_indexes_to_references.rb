class AddIndexesToReferences < ActiveRecord::Migration
  def change
    add_index :cards, :mtg_set_id
    add_index :cards_decks, :card_id
    add_index :cards_decks, :deck_id
    add_index :cards_sideboards, :card_id
    add_index :cards_sideboards, :sideboard_id
    add_index :comments, :commentable_id
    add_index :comments, :commentable_type
    add_index :decks, :user_id
    add_index :mtg_sets, :mtg_block_id
    add_index :sideboards, :deck_id
    add_index :suggestion_additions, :card_id
    add_index :suggestion_additions, :suggestion_id
    add_index :suggestion_deletions, :card_id
    add_index :suggestion_deletions, :suggestion_id
    add_index :suggestion_sideboard_additions, :card_id
    add_index :suggestion_sideboard_additions, :suggestion_id
    add_index :suggestion_sideboard_deletions, :card_id
    add_index :suggestion_sideboard_deletions, :suggestion_id
    add_index :suggestions, :user_id
    add_index :suggestions, :deck_id
    add_index :users, :email
    add_index :users, :username
  end
end
