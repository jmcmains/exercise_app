class OptionalAccessoriesController < ApplicationController
  
  def index
    @title = "All Optional Accessories"
    @optional_accessories = OptionalAccessory.all
  end
  
  def export_disp
  	@title = "exercise accessory"
  end
  
  def show
  	@optional_accessory = OptionalAccessory.find(params[:id])
  end
  
  def edit
  	@optional_accessory = OptionalAccessory.find(params[:id])
  	@title = "Edit Optional Accessory"
  end
  
  def update
    @optional_accessory = OptionalAccessory.find(params[:id])
    if @optional_accessory.update_attributes(params[:optional_accessory])
      flash[:success] = "Profile updated."
    	redirect_to optional_accessories_path
    else
      @title = "Edit Optional Accessory"
      render 'edit'
    end
  end

	def destroy
		OptionalAccessory.find(params[:id]).destroy
    flash[:success] = "Category destroyed."
    redirect_to optional_accessories_path
  end
  
  def new
  	@optional_accessory = OptionalAccessory.new
  	@title = "New Category"
  end
  
  def create
    @optional_accessory = OptionalAccessory.new(params[:optional_accessory])
    if @optional_accessory.save
      redirect_to optional_accessory_path
    else
      @title = "Sign up"
      render 'new'
    end
  end
end