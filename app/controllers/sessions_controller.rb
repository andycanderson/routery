class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:user_email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id.to_s
			redirect_to "/locations"
		else
			redirect_to :back
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/'
	end

end
