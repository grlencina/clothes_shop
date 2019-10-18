class Transaction < ApplicationRecord
	belongs_to :user
	has_many :orders
	has_many :items, through: :orders
end
