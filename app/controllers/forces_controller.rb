class ForcesController < ApplicationController
  
  def index
    @title = "All Forces"
    @forces = Force.all
  end
  
  def show
  	@force = Force.find(params[:id])
  end
  
  def edit
  	@force = Force.find(params[:id])
  	@title = "Edit Force"
  end
  
  def update
    @force = Force.find(params[:id])
    if @force.update_attributes(params[:force])
      flash[:success] = "Profile updated."
    	redirect_to forces_path
    else
      @title = "Edit Force"
      render 'edit'
    end
  end

	def destroy
		Force.find(params[:id]).destroy
    flash[:success] = "Force destroyed."
    redirect_to forces_path
  end
  
  def new
  	@force = Force.new
  	@title = "New Force"
  end
  
  def create
    @force = Force.new(params[:force])
    if @force.save
      redirect_to forces_path
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  
end
