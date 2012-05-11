class ExercisesController < ApplicationController

  def expand
  	@exercise = Exercise.find(params[:id])
  	respond_to do |format|
			format.js
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
  end

  def update
  	@exercise = Exercise.find(params[:id])
  	@categories = params[:exercise][:categories]
  	@accessories = params[:exercise][:accessories]
  	@positions = params[:exercise][:positions]
  	@heights = params[:exercise][:heights]
  	@muscles = params[:exercise][:muscles]
  	@primary_muscle = params[:exercise][:exercise_muscles]
  	@forces = params[:exercise][:forces]
  	@posts = params[:exercise][:posts]
    if @exercise.update_attributes(:name => params[:exercise][:name], :description => params[:exercise][:description])
    
    	@exercise.categories.map { |category| @exercise.exclude_category!(category) }
		  @categories.each {|category| @exercise.include_category_id!(category.to_f) unless category.blank? }
		  
    	@exercise.accessories.map { |accessory| @exercise.exclude_accessory!(accessory) }
		  @accessories.each {|accessory| @exercise.include_accessory_id!(accessory.to_f) unless accessory.blank? }
		  
		  @exercise.positions.map { |position| @exercise.exclude_position!(position) }
		  @positions.each {|position| @exercise.include_position_id!(position.to_f) unless position.blank? }
		  
		  @exercise.heights.map { |height| @exercise.exclude_height!(height) }
		  @heights.each {|height| @exercise.include_height_id!(height.to_f) unless height.blank? }
		  
		  @exercise.forces.map { |force| @exercise.exclude_force!(force) }
		  @forces.each {|force| @exercise.include_force_id!(force.to_f) unless force.blank? }

		  @exercise.posts.map { |post| @exercise.exclude_post!(post) }
		  @posts.each {|post| @exercise.include_post_id!(post.to_f) unless post.blank? }
		  
		  @exercise.muscles.map { |muscle| @exercise.exclude_muscle!(muscle) }
		  @muscles.each {|muscle| @exercise.include_muscle_id!(muscle.to_f) unless muscle.blank? }
		  @exercise.toggle_primary!(@primary_muscle)
		  
      redirect_to exercises_path
    else
      @title = "Error"
      render 'new'
    end
  end
  
	def destroy
		Exercise.find(params[:id]).destroy
    flash[:success] = "Category destroyed."
    redirect_to categories_path
  end
  
  def create
  	@exercise = Exercise.new(params[:exercise])
    if @exercise.save
      redirect_to categories_path
    else
      render 'new', :layout => false
    end
  end
  
  def new
  	@exercise = Exercise.new
  	@exercise_categories = @exercise.exercise_categories.build
  	@exercise_muscles = @exercise.exercise_muscles.build
  	@exercise_posts = @exercise.exercise_posts.build
  	@exercise_heights = @exercise.exercise_heights.build
  	@exercise_forces = @exercise.exercise_forces.build
  	@exercise_positions = @exercise.exercise_positions.build
  	@exercise_accessories = @exercise.exercise_accessories.build
  	render :layout => false
  end
end
