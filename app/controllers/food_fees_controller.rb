 class FoodFeesController < ApplicationController

  def index
  	@food_fees = current_owner.food_fees.all
  end


	def new
    @food_fee = current_owner.food_fees.new
	end

  
	def create
    @food_fee =  current_owner.food_fees.create(food_fee_params)
	  if @food_fee.save
	    redirect_to owner_food_fees_path
	  else
	    render 'new'
	  end
  end

  def edit
  	@food_fee = current_owner.food_fees.find(params[:id])
  end

  def update
  	@food_fee = current_owner.food_fees.find(params[:id])
    if @food_fee.update_attributes(food_fee_params)  
      flash[:notice] = "Successfully Update food_fee." 
	    redirect_to  owner_food_fees_path
	  else
	    render :action => 'edit'
	  end
  end

  def destroy
    @food_fee = current_owner.food_fees.find(params[:id])
    if @food_fee.destroy
      redirect_to owner_food_fees_path
    end
  end

  private

  def food_fee_params
    params.require(:food_fee).permit(:timing, :price, :status,  :owner_id)
  end
	

end
