class TripsController < ApplicationController
	before_filter :check_login

	def show
		@trip_id = params[:id]
    @trip = Trip.find(params[:id])
    # gets all locations for this trip 
		@locations = Location.where(trip_id: params[:id])
	end

	def create
		trip = Trip.new(params.require(:trip).permit(:trip_name))
		
		trip.trip_name = params[:trip][:trip_name]
		# add user id to trip created
		trip.user = @current_user
		if trip.save!
			redirect_to user_path(@current_user)
		else
			redirect_to "/mylocations"
		end
	end

	def update

	end

  def destroy
    Location.where(trip_id: params[:id]).destroy
    Trip.find(params[:id]).destroy
    redirect_to user_path(@current_user)
  end


end
