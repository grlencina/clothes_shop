class Item < ApplicationRecord
	belongs_to :category
	has_many :orders
	has_many :purchases, through: :orders

	validates :name, presence: true
	validates :description, presence: true
	validates :images, presence: true
	validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1}
	validates :price, presence: true, numericality: {greater_than_or_equal_to: 1}

end
