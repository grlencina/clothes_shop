class FixFloatTypes < ActiveRecord::Migration[6.0]
  def change
  	change_column :items, :price, :decimal
  	change_column :orders, :totalPrice, :decimal
  end
end
