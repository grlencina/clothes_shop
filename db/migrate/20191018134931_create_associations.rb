class CreateAssociations < ActiveRecord::Migration[6.0]
  def change
  	change_table :transactions do |t|
  		t.belongs_to :user
  	end
  	change_table :orders do |o|
  		o.belongs_to :transaction
  		o.belongs_to :item
  	end
  	change_table :items do |i|
  		i.belongs_to :category
  	end
  end
end
