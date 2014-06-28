class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			if user.type == 'Patron'
				redirect_to root_path, notice: 'successfully signed in'
			else
				redirect_to user, notice: 'successfully signed in'
			end
		else
			flash.now[:alert] = "invalid email or password"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end
