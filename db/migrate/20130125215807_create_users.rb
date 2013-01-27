class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :phone
      t.datetime :last_seen

      t.timestamps
    end
  end
end
