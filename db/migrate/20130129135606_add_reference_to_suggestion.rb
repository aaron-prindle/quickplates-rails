class AddReferenceToSuggestion < ActiveRecord::Migration
  def change
    add_column :suggestions, :reference, :text
  end
end
