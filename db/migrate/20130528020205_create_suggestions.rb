class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :title
      t.text :content
      t.references :user
      t.references :deck

      t.timestamps
    end
  end
end
