class UsersController < ApplicationController
	def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
    	sign_in @user
			render 'create'
    else
      render 'new'
    end
  end
  
  def index
  	@users = User.all
  end
end
