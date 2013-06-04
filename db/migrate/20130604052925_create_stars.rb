class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.integer :user_id
      t.integer :deck_id

      t.timestamps
    end
    add_index :stars, :user_id
    add_index :stars, :deck_id
  end
end
