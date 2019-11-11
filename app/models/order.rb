class Order < ApplicationRecord
	belongs_to :item
	belongs_to :purchase

	validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1}
	validates :totalPrice, presence: true, numericality: {greater_than_or_equal_to: 1}
end
