class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name, null: false
      t.string :address, null: false
      t.string :restaurant_type, null: false

      t.timestamps
    end
  end
end
