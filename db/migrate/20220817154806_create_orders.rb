class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :item_name, null: false
      t.integer:quantity, null: false
      t.float :price ,null: false
      t.string :delivery_address, null: false
      t.references :restaurant, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
