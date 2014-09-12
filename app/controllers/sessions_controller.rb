class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:user_email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id.to_s
			# brings user to their home page

			redirect_to home_path
		else
			# redirect_to root_path for invalid email/pw
			# also makes a flash notice for user
			redirect_to root_path, :flash => { :notice => "incorrect email or password" }
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/'
	end

end
