class UsersController < ApplicationController
	before_filter :check_login, except: [:create]

	def create
		user = User.new
		# saves users email in downcase form
		user.email = params[:user][:email].downcase
		user.name = params[:user][:name]
		user.password = params[:user][:password]
		user.password_confirmation = params[:user][:password_confirmation]
		if user.save
			# saves user id to session
			session[:user_id] = user.id.to_s
			redirect_to "/mylocations"
		else
			redirect_to root_path(anchor: 'create-title'), :flash => { :create => "Invalid email or name input" }
		end
	end	

	# shows all trips for user
	def show
		@trips = Trip.where(user_id: @current_user)
		#populates map with user's locations 
		locations = Location.where(user_id: @current_user)
		@arr = []
		@descriptions = []
    @names = []
		locations.each do |location| 
			@arr<<location.coordinates
			@names<<location.name
			@descriptions<<location.description 
		end
	end
end
