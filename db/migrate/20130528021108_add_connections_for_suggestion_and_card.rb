class AddConnectionsForSuggestionAndCard < ActiveRecord::Migration
  def change
    create_table :suggestion_additions do |t|
      t.references :card
      t.references :suggestion
    end

    create_table :suggestion_deletions do |t|
      t.references :card
      t.references :suggestion
    end

    create_table :suggestion_sideboard_additions do |t|
      t.references :card
      t.references :suggestion
    end

    create_table :suggestion_sideboard_deletions do |t|
      t.references :card
      t.references :suggestion
    end
  end
end
