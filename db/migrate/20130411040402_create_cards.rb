class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.string :main_type
      t.string :sub_type
      t.integer :power
      t.integer :toughness
      t.integer :cmc
      t.string :mana_cost, array: true
      t.integer :loyalty
      t.string :image_url
      t.text :description
      t.string :gatherer_url
      t.string :rarity
      t.references :mtg_set

      t.timestamps
    end
    add_index :cards, :title
    add_index :cards, :main_type
    add_index :cards, :power
    add_index :cards, :toughness
    add_index :cards, :cmc
  end
end
