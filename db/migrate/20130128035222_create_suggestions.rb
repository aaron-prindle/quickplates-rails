class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.integer :wait
      t.integer :votes_for
      t.integer :votes_against

      t.timestamps
    end
  end
end
