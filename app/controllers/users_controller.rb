class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  private

  def allowed_params
  	params.require(:user).permit(:name, :password, :salt, :encrypted_password)
  end
end