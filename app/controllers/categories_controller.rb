class CategoriesController < ApplicationController
  
  def index
    @title = "All Categories"
    @sel="All"
    @exercises=Exercise.all;
  end
  
  def display
		@category = Category.find(params[:id])
		@exercises = @category.exercises
		@name = @category.name
		@showDesc = true
		respond_to do |format|
			format.js
		end
  end
  
  def displayall
		@name = "All"
		@category = Category.find(1)
		@exercises = Exercise.all
		@showDesc = false
		respond_to do |format|
			format.js { render 'display' }
		end
  end
  
  def show
  	@category = Category.find(params[:id])
  	@sel = @category.name
  	@title = "All Categories"
    @clickex=false
    render categories_path
    redirect_to display_category_path
  end
  
  def edit
  	@category = Category.find(params[:id])
  	@title = "Edit Category"
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:success] = "Profile updated."
    	redirect_to categories_path
    else
      @title = "Edit Category"
      render 'edit'
    end
  end

	def destroy
		Category.find(params[:id]).destroy
    flash[:success] = "Category destroyed."
    redirect_to categories_path
  end
  
  def new
  	@category = Category.new
  	@title = "New Category"
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to categories_path
    else
      @title = "Sign up"
      render 'new'
    end
  end
end
