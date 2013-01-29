class AddReferenceToSuggestion < ActiveRecord::Migration
  def change
    add_column :suggestions, :reference, :string
  end
end
