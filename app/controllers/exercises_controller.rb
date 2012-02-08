class ExercisesController < ApplicationController
  def index
    @title = "All Exercises"
    @exercises = Exercise.all
  end
  
  def show
  	@expand=true
  	@exercise = Exercise.find(params[:id])
  	@title = @exercise.name;
  end
  
 	def expand
		@expand=false
  	@exercise = Exercise.find(params[:id])
  	@title = "expand";
  	render exercise_path
	end
	
	def collapse
		
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
  	@exercise = Exercise.new(:name => params[:exercise][:name], :description => params[:exercise][:description])
  	@categories = params[:exercise][:categories]
  	@accessories = params[:exercise][:accessories]
  	@positions = params[:exercise][:positions]
  	@heights = params[:exercise][:heights]
  	@forces = params[:exercise][:forces]
  	@posts = params[:exercise][:posts]
    if @exercise.save
		  @categories.each {|category| @exercise.include_category_id!(category.to_f) unless category.blank? }
		  @accessories.each {|accessory| @exercise.include_accessory_id!(accessory.to_f) unless accessory.blank? }
		  @positions.each {|position| @exercise.include_position_id!(position.to_f) unless position.blank? }
		  @heights.each {|height| @exercise.include_height_id!(height.to_f) unless height.blank? }
			@forces.each {|force| @exercise.include_force_id!(force.to_f) unless force.blank? }
			@posts.each {|post| @exercise.include_post_id!(post.to_f) unless post.blank? }
      redirect_to categories_path
    else
      @title = "Error"
      render 'new'
    end
  end
  
  def new
  	@exercise = Exercise.new
  	@title = "New Exercise"
  end
end
