class OwnersController < ApplicationController

	def create
		@owner = Owner.new(owner_params)

		if @owner.save 
			session[:user_id] = @owner.id
			flash[:notice] = 'Account successfully created'
			redirect_to @owner
		else
			flash[:alert] = 'There has been an error'
			redirect_to new_user_path
		end
	end

	def show
		@restaurants = Restaurant.where(user_id: params[:id])
	end

	def destroy
	end

	private

	def owner_params
		params.require(:owner).permit(:email, :password, :password_confirmation)
	end
end
