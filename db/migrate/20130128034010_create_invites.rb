class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :group_id
      t.string :username
      t.boolean :accept

      t.timestamps
    end
  end
end
