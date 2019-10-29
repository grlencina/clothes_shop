class ChangeOrderIdsToTransaction < ActiveRecord::Migration[6.0]
  def change
    change_table :transactions do |t|
    	t.text :order_id, array: true, default: []
    end
  end
end
