class ApplicationController < ActionController::Base

	def hello
		render html: "URL Shortener coming up!"
	end

end
