class LocationsController < ApplicationController
	before_filter :no_login

	def index
		# @locations = Location.where(trip_id: params[:id])

	end

	def create
		location = Location.new(params.require(:location).permit(:address))
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

end
