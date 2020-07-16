class UrlsController < ApplicationController
  before_action :find_url, only: [:show]
  
  def index
  	@urls = current_user.urls.all
  end

  def new
  	@url = Url.new
  end

  def create
    @url = Url.new(url_params)
    # @url.sanitize
    if !@url.new_url?
      flash[:info] = "A shurl for this URL already exists: #{@url.find_duplicate.short_url}"
      redirect_to root_url
    else
      @url.user_id = current_user.id
    	if @url.save
    		flash[:success] = "Url shortened."
    		redirect_to root_url
    	else
    		flash[:danger] = "Error shortening URL."
    		redirect_to root_url
    	end
    end  
  end

  def show
    @url = Url.find_by_short_url(params[:short_url])
    redirect_to @url.long_url.to_s
    @url.clicked!
  end

  	private

    def find_url
      @url = Url.find_by_short_url(params[:short_url])
    end

  	def url_params
  		params.require(:url).permit(:name, :long_url)
  	end

end
