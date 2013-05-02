class CreateCardsSideboards < ActiveRecord::Migration
  def change
    create_table :cards_sideboards do |t|
      t.references :card
      t.references :sideboard
    end
  end
end
