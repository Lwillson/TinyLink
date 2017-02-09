class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def show
  	@link = Link.find(params[:id])
  end

  def create
  	@link = begin
  		Link.find_or_create_by(allowed_params)
	rescue ActiveRecord::RecordNotUnique
  		retry
	end

    if @link 
    	redirect_to @link 
    else
    	render :new
    end
  end

  def go
  	@link = Link.link_for_str(params[:code])
  	redirect_to @link.url
  end

  private

  def allowed_params
    params.require(:link).permit(:url)
  end
end