class UserFee < ApplicationRecord
	belongs_to :owner
	belongs_to :user
	belongs_to :food_fee
end
