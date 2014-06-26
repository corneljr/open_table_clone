class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_path, notice: 'successfully signed in'
		else
			render :new, notice: "invalid email or password"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end
