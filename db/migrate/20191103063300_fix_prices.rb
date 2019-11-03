class FixPrices < ActiveRecord::Migration[6.0]
  def change
  	change_column :items, :price, :float
  	change_column :orders, :totalPrice, :float
  end
end
