class EntriesController < ApplicationController
	before_action :user_id, :except => [:index]

	def new
		@entry = Entry.new
	end


  def index
    @entries = Entry.all
  end


  def show
    @entry = Entry.find(params[:id])
  end

  def create
    @entry = @user.build_entry(entry_params)
	  if @entry.save
	    redirect_to root_path
	  else
	    render 'new'
	  end
  end

	private
  def user_id
    @user = current_owner.users.find(params[:user_id])
  end

  def entry_params
    params.require(:entry).permit(:date_time)
  end
end
