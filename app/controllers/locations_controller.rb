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
		location.name = params[:location][:name]
		location.description = params[:location][:description]
		if location.save
			redirect_to "/trips/#{location.trip_id}"
		else
			render 'new'
		end
	end

	def destroy
		location = Location.find(params[:format])
		trip_id = location.trip_id
		location.destroy

		# stay on trip page 
		redirect_to trip_path(trip_id)
	end


# pins that are dropped
	def dropped_pins
		location = Location.new
		location.name = params[:locations][:name]
		location.description = ""
		location.user_id = @current_user.id
		location.trip_id = params[:locations][:trip_id]
		location.coordinates = [params[:locations][:pin][1].to_f, params[:locations][:pin][0].to_f]
		location.save!
		
		@redirect = "/trips/#{params[:locations][:trip_id]}"
		
	end

end
