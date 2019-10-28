class AddTotalPriceToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :totalPrice, :float
  end
end
