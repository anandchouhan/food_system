class UsersController < ApplicationController
  before_action :authenticate_owner!
  def index
    @users = current_owner.users.all
	end


  def show
  	@user = User.find(params[:id])
  end

	def new
    @user = current_owner.users.new
	end


	def create
    @user =  current_owner.users.create(user_params)
	  if @user.save
	    redirect_to root_path
	  else
	    render 'new'
	  end
  end


  def edit
  	@user = current_owner.users.find(params[:id])
  end

  def update
  	@user = current_owner.users.find(params[:id])
    if @user.update_attributes(user_params)  
      flash[:notice] = "Successfully Update User." 
	    redirect_to root_path
	  else
	    render :action => 'edit'
	  end
  end

  def destroy
    @user = current_owner.users.find(params[:id])
    if @user.destroy
      redirect_to root_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :mob_no,  :owner_id, :avatar )
  end
	
end
