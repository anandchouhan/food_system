class FoodFee < ApplicationRecord
	validates :timing, :price, :status, presence: true
	belongs_to :owner
	has_many :user_fees, :dependent => :destroy
	FEE_STATUS = ["Active", "Inactive"]
end
