class WorkoutsController < ApplicationController
  
  def index
    @title = "All Workouts"
    @workouts = Workout.all
  end
  
  def show
		@title = "All Categories"
		workout = Workout.find(params[:id])
		id= workout.id;
		@sel="wo#{id}"
		@clickex=false
		render 'categories/index'
  end
  
  def display
		@workout = Workout.find(params[:id])
		@exercises = @workout.exercises
		@name = @workout.name
		@showDesc = true
		respond_to do |format|
			format.js
		end
  end
  
  def likepage
		@workout = Workout.find(params[:id])
		@title = @workout.name
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
