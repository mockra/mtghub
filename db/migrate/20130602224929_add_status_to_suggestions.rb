class AddStatusToSuggestions < ActiveRecord::Migration
  def change
    add_column :suggestions, :open, :boolean, default: true
  end
end
