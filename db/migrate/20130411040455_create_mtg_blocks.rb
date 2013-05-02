class CreateMtgBlocks < ActiveRecord::Migration
  def change
    create_table :mtg_blocks do |t|
      t.string :title

      t.timestamps
    end
  end
end
