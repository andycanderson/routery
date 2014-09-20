class SessionsController < ApplicationController
	# by default rails uses cookies to store sessions

	def new
	end

	def create
		# if errors out because email not found short circuit authentication
		begin
			user = User.find_by(email: params[:user_email].downcase)
		rescue
			user = false
		end

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id.to_s
			# brings user to their home page

			redirect_to home_path
		else
			# redirect_to root_path for invalid email/pw
			# also makes a flash notice for user
			redirect_to root_path, :flash => { :login => "Incorrect email or password" }
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end

end
