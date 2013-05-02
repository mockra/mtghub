class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title
      t.string :format
      t.string :tags, array: true
      t.string :colors, array: true
      t.integer :origin_id
      t.references :user

      t.timestamps
    end
    add_index :decks, :origin_id
  end
end
