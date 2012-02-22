class WorkoutsController < ApplicationController
  
  def index
    render 'categories/index'
  end
  
  def show
		@workout = Workout.find(params[:id])
		respond_to do |format|
			format.html
			format.js
		end
  end
  
  def likepage
		@workout = Workout.find(params[:id])
		render :action => 'likepage', :layout => false
  end
  
  def edit
  	@workout = Workout.find(params[:id])
  	@title = "Edit Workout"
  end
  
  def update
    @workout = Workout.find(params[:id])
    if @workout.update_attributes(params[:workout])
      flash[:success] = "Profile updated."
    	redirect_to workouts_path
    else
      @title = "Edit Workout"
      render 'edit'
    end
  end

	def destroy
		Workout.find(params[:id]).destroy
    flash[:success] = "Workout destroyed."
    redirect_to workouts_path
  end
  
  def new
  	@workout = Workout.new
  	@title = "New Workout"
  end
  
  def create
    @workout = Workout.new(params[:workout])
    if @workout.save
      redirect_to workouts_path
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  
end
