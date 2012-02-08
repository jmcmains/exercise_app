class PositionsController < ApplicationController
  
  def index
    @title = "All Positions"
    @positions = Position.all
  end
  
  def show
  	@position = Position.find(params[:id])
  end
  
  def edit
  	@position = Position.find(params[:id])
  	@title = "Edit Position"
  end
  
  def update
    @position = Position.find(params[:id])
    if @position.update_attributes(params[:position])
      flash[:success] = "Profile updated."
    	redirect_to positions_path
    else
      @title = "Edit Position"
      render 'edit'
    end
  end

	def destroy
		Position.find(params[:id]).destroy
    flash[:success] = "Category destroyed."
    redirect_to positions_path
  end
  
  def new
  	@position = Position.new
  	@title = "New Category"
  end
  
  def create
    @position = Position.new(params[:position])
    if @position.save
      redirect_to position_path
    else
      @title = "Sign up"
      render 'new'
    end
  end
end
