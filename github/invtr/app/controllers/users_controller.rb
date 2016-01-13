class UsersController < ApplicationController
	before_action :authenticate_user!

	def new
		@user = User.new  
	end 

	def show
		@user = User.find(params[:id])
	end 

	def edit 
		@user = User.find(params[:id])
	end 

	def create
		@user = User.new(user_params) 
		if @user.save
		    flash[:notice] = "User #{@user.name} saved."
		 	redirect_to user_path(@user)
		else
		    flash[:alert] = "User #{@user.name} not saved."
		    render :new
		end
	end

	def update
		@user = User.find(params[:id])
		if  @user.update_attributes(user_params)
		    flash[:notice] = "User #{@user.name} successfully updated."
		    redirect_to edit_user_path(@user)
		else
		    flash[:alert] = "User #{@user.name} not updated."
		    redirect_to new_user_path(@user)
		end
	end

	def destroy
		@user = User.find(params[:id])
        @user.destroy
        flash[:alert] = "User Deleted" 

        #TODO set a better redirect
        redirect_to new_user_path
        # redirect_to root_path
	end

private 
	
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :name, :role, :city, :state_or_region, :country, :latitude, :longitude)
	end 


end
