class CreateMtgSets < ActiveRecord::Migration
  def change
    create_table :mtg_sets do |t|
      t.string :title
      t.string :code
      t.references :mtg_block

      t.timestamps
    end
    add_index :mtg_sets, :title
  end
end
