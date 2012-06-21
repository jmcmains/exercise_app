class ExercisesController < ApplicationController

  def expand
  	if params[:id].blank?
  		@exercise = Exercise.new
  		Category.all.count.times do
				categories = @exercise.exercise_categories.build
			end
			TargetMuscle.all.count.times do
				tm = @exercise.exercise_muscles.build
			end
			Post.all.count.times do
				p = @exercise.exercise_posts.build
			end
			AnchorPointHeight.all.count.times do
				aph = @exercise.exercise_heights.build
			end
			Force.all.count.times do
				f = @exercise.exercise_forces.build
			end
			Position.all.count.times do
				p = @exercise.exercise_positions.build
			end
			OptionalAccessory.all.count.times do
				oa = @exercise.exercise_accessories.build
			end
			3.times do
				tips = @exercise.tips.build
			end
			3.times do
				variation = @exercise.variations.build
			end
  	else
			@exercise = Exercise.find(params[:id])
			respond_to do |format|
				format.js
			end
		end
  end
  
  def collapse
  	@exercise = Exercise.find(params[:id])
  	respond_to do |format|
			format.html { redirect_to @exercise }
			format.js
		end
  end
  
  def likepage
		@exercise = Exercise.find(params[:id])
		render :action => 'likepage', :layout => false
  end
  
  def show
  	@exercise = Exercise.find(params[:id])
  	@title = @exercise.name + " | Rubberbanditz Exercise Library"
  end

  def edit
  	@exercise = Exercise.find(params[:id])
  	@title = "Edit Exercise"
  	@exercise.videos.build
  	@exercise.exercise_pictures.build
  	@exercise.tips.build
 		@exercise.variations.build
 		respond_to do |format|
			format.html
			format.js
		end
  end

  def update
  	@exercise = Exercise.find(params[:id])
  	if @exercise.update_attributes(params[:exercise])
      redirect_to @exercise
    else
      @title = "Error"
      render 'new'
    end
  end
  
	def destroy
		Exercise.find(params[:id]).destroy
    flash[:success] = "Exercise destroyed."
    redirect_to root_path
  end
  
  def create
  	@exercise = Exercise.new(params[:exercise])
    if @exercise.save
      redirect_to @exercise
    else
      render 'new'
    end
  end
  
  def new
  	@exercise = Exercise.new
  	3.times do
  		tips = @exercise.tips.build
  	end
  	3.times do
  		variation = @exercise.variations.build
  	end
  	@exercise.videos.build
  	@exercise.exercise_pictures.build
  end
  
  def index
  	@title = "Exercise Search"
  	@exercises = Exercise.search(params[:search])
  	respond_to do |format|
			format.html
			format.js
		end
  end
end
