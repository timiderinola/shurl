class StaticPagesController < ApplicationController

	def home
		@user = User.new
		@url = current_user.urls.build if logged_in?
	end
	
end
