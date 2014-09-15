class LocationsController < ApplicationController
	before_filter :check_login

	def index
		

	end

	def create
		location = Location.new(params.require(:location).permit(:address, :description))
		location.user = @current_user
		location.trip_id = params[:id]
		
		if location.save
			redirect_to "/locations/#{location.id}"
		else
			render 'new'
		end
	end

	def show
		@location = Location.find_by(id: params[:id])
	end

	def update
		location = Location.find_by(id: params[:id])
		location.address = params[:location][:address]
		location.description = params[:location][:description]
		if location.save
			redirect_to "/locations/#{location.id}"
		else
			render 'new'
		end
	end

	def destroy
		@trip_id = Location.find_by(id: params[:id]).trip_id
		Location.find_by(id: params[:id]).destroy

		# stay on trip page 
		redirect_to trip_path(@trip_id)
	end


# pins that are dropped
	def dropped_pins
		
		location = Location.new
		location.name = params[:locations][:name]
		location.description = ""
		location.trip_id = params[:locations][:trip_id]
		location.user_id = @current_user.id
		location.coordinates = params[:locations][:pin]
		location.save!
		
		@redirect = '/mylocations'

		# respond_to do |format|
		# 	format.html {redirect_to :back}
		# end



		


		# all_pins = []
		# # get coords and trip id which is first in array
		# params[:locations].each do |k, v|
		# 	all_pins << v
		# end

		# trip_id = all_pins.slice!(0)[0]

		# all_pins.each do |pin|
		# 	location = Location.new
		# 	location.address = pin
		# 	location.description = ""
		# 		# add ids
		# 	location.user_id = @current_user.id
		# 	location.trip_id = trip_id
		# 	location.coordinates = pin
			
		# 	location.save!
		# end



		
	end

end
