class HomeController < ApplicationController

	def index
		if @current_user != nil
      # directs to all user's trips
			redirect_to "/users/#{@current_user.id}"
		end
	end
end
