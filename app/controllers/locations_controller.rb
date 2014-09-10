class LocationsController < ApplicationController
	def index
		@locations = Location.all
	end

	def new 
		@location = Location.new
	end

	def create
		@location = Location.new(params.require(:location).permit(:address))
		if @location.save
			redirect_to locations_path
		else
			render 'new'
		end
	end

	def show

	end
end
