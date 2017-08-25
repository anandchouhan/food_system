class UserFeesController < ApplicationController

	def create
		@owner = Owner.find(params[:owner_id])
		@food_fee = FoodFee.find(params[:food_fee_id])
		@user_fee = @food_fee.user_fees.create(user_id: params[:user_id])
		@user_fee.owner_id = current_owner.id 
		if @user_fee.save 
			redirect_to new_owner_food_fee_user_fee_path
	  end
	end

  def new
    @food_fees = current_owner.food_fees.all
  end

	def index
    @food_fees = current_owner.food_fees
    @users = current_owner.users
		@user_fees = UserFee.where('user_fees.food_fee_id in (?) and user_fees.user_id in (?)', @food_fees.map(&:id), @users.map(&:id))
		@fees = FoodFee.joins(:user_fees).where('user_fees.id in (?)', @user_fees.map(&:id) ) 
		@total_income = @fees.inject(0) { |sum, value| sum += value.price }
	end

end
