class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :tag, null: false, unique: true
      t.string :tag_description, null: false

      t.timestamps
    end
  end
end
