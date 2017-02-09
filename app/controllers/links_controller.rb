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
    @link = Link.new(allowed_params)
    if @link.save
      flash[:notice] = 'Successfully created link.'

      redirect_to @link
    else
      render :new
    end
  end

  private

  def allowed_params
    params.require(:link).permit(:url)
  end
end