class TargetMusclesController < ApplicationController
  
  def index
    @title = "All Target Muscles"
    @target_muscles = TargetMuscle.all
  end
  
  def show
  	@target_muscle = TargetMuscle.find(params[:id])
  end
  
  def edit
  	@target_muscle = TargetMuscle.find(params[:id])
  	@title = "Edit Target Muscle"
  end
  
  def update
    @target_muscle = TargetMuscle.find(params[:id])
    if @target_muscle.update_attributes(params[:target_muscle])
      flash[:success] = "Profile updated."
    	redirect_to target_muscles_path
    else
      @title = "Edit Target Muscle"
      render 'edit'
    end
  end

	def destroy
		TargetMuscle.find(params[:id]).destroy
    flash[:success] = "Target Muscle destroyed."
    redirect_to target_muscle_path
  end
  
  def new
  	@target_muscle = TargetMuscle.new
  	@title = "New Target Muscle"
  end
  
  def create
    @target_muscle = TargetMuscle.new(params[:target_muscle])
    if @target_muscle.save
      redirect_to target_muscles_path
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  
end
