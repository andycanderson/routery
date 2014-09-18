class UsersController < ApplicationController
	before_filter :check_login, except: [:create]

	def new
	end

	def create
		user = User.new
		user.email = params[:user][:email]
		user.name = params[:user][:name]
		user.password = params[:user][:password]
		user.password_confirmation = params[:user][:password_confirmation]
		if user.save
			# saves user id to session
			session[:user_id] = user.id.to_s
			redirect_to "/mylocations"
		else
			redirect_to '/'
		end
	end	

	# shows all trips for user
	def show
		@trips = Trip.where(user_id: @current_user.id)

		#populates map with user's locations 
		locations = Location.where(user_id: @current_user.id)
		@arr = []
		@descriptions = []
    @names = []
		locations.each do |location| 
			@arr<<location.coordinates
			@names<<[location.name]
			@descriptions<<[location.description] 
		end
	end
end
