class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :stock
      t.float :price
      t.string :images

      t.timestamps
    end
  end
end
