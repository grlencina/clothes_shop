class ChangeColumnToPurchase < ActiveRecord::Migration[6.0]
  def change
  	rename_column :orders, :transaction_id, :purchase_id
  end
end
