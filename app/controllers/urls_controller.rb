class UrlsController < ApplicationController
  
  def index
  	@urls = current_user.urls.all
  end

  def new
  	@url = Url.new
  end

  def create
  	@url = current_user.urls.build(url_params)
  	# @url.short_url = @url.get_shurl
  	# @url.long_url = @url.sanitize
  	if @url.save
  		flash[:success] = "Url shortened."
  		redirect_to root_url
  	else
  		flash[:error] = "Error shortening URL"
  		redirect_to root_url
  	end

  	def show
  		@url = Url.find(params[:id])
  		redirect_to @url.long_url
  	end
  end

  	private 

  	def url_params
  		params.require(:url).permit(:name, :long_url)
  	end

end
