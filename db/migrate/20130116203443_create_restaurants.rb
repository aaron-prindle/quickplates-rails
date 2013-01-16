class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.integer :wait

      t.timestamps
    end
  end
end
