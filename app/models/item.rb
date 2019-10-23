class Item < ApplicationRecord
	belongs_to :category
	has_many :orders
	has_many :transactions, through: :orders
end
