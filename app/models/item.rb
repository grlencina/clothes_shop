class Item < ApplicationRecord
	belongs_to :categories
	has_many :orders
	has_many :transactions, through: :orders
end
