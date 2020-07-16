class ApplicationController < ActionController::Base
	include SessionsHelper

	def hello
		render html: "URL Shortener coming up!"
	end

end
