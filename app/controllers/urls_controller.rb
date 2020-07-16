class UrlsController < ApplicationController
  before_action :find_url, only: [:show]
  
  def index
  	@urls = current_user.urls.all
  end

  def new
  	@url = Url.new
  end

  def create
  	@url = current_user.urls.build(url_params)
    @url.sanitize
    if !@url.new_url?
      flash[:notice] = "A shurl for this URL already exists."
      redirect_to root_url
    else
    	if @url.save
    		flash[:success] = "Url shortened."
    		redirect_to root_url
    	else
    		flash[:error] = "Error shortening URL."
    		redirect_to root_url
    	end
    end

  	def show
      @url = Url.find_by_short_url(params[:short_url])
  		redirect_to @url.long_url.to_s
      @url.clicked!
      debugger
  	end
    
  end

  	private

    def find_url
      @url = Url.find_by_short_url(params[:short_url])
    end

  	def url_params
  		params.require(:url).permit(:name, :long_url)
  	end

end
