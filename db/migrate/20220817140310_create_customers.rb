class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :mobile_number, limit: 10, null: false
      t.string :email, null: false, unique: true
      t.string :address, null: false

      t.timestamps
    end
  end
end
