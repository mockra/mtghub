class CreateSideboards < ActiveRecord::Migration
  def change
    create_table :sideboards do |t|
      t.references :deck

      t.timestamps
    end
  end
end
