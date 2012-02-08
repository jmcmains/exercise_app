class AnchorPointHeightsController < ApplicationController
  
  def index
    @title = "All Anchor Point Heights"
    @anchor_point_heights = AnchorPointHeight.all
  end
  
  def show
  	@anchor_point_height = AnchorPointHeight.find(params[:id])
  end
  
  def edit
  	@anchor_point_height = AnchorPointHeight.find(params[:id])
  	@title = "Edit Anchor Point Height"
  end
  
  def update
    @anchor_point_height = AnchorPointHeight.find(params[:id])
    if @anchor_point_height.update_attributes(params[:anchor_point_height])
      flash[:success] = "Profile updated."
    	redirect_to anchor_point_heights_path
    else
      @title = "Edit Anchor Point Height"
      render 'edit'
    end
  end

	def destroy
		AnchorPointHeight.find(params[:id]).destroy
    flash[:success] = "Category destroyed."
    redirect_to anchor_point_heights_path
  end
  
  def new
  	@anchor_point_height = AnchorPointHeight.new
  	@title = "New Category"
  end
  
  def create
    @anchor_point_height = AnchorPointHeight.new(params[:anchor_point_height])
    if @anchor_point_height.save
      redirect_to anchor_point_height_path
    else
      @title = "Sign up"
      render 'new'
    end
  end
end
