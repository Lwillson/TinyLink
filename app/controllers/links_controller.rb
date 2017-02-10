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

  # maps the short link into the full url and redirects there
  def go
  	@link = Link.link_for_str(params[:code])
  	redirect_to @link.url
  end

  def users
  	@link = Link.find(params[:id])
  	json_response(@link.users)
  end

  def user_info
  	
  end

  private

  def allowed_params
    params.require(:link).permit(:url)
  end
end