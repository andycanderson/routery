class HomeController < ApplicationController

	def index
    @home_page = true;
		if @current_user != nil
      # directs to all user's trips
			redirect_to "/users/#{@current_user.id}"
		end
	end
end
