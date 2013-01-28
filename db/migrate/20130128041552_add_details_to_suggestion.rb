class AddDetailsToSuggestion < ActiveRecord::Migration
  def change
    add_column :suggestions, :group_id, :integer
  end
end
