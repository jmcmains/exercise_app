class CategoriesController < ApplicationController

  def index
		respond_to do |format|
			format.html
			format.js
		end
  end
  
  def likepage
		@category = Category.find(params[:id])
		render :action => 'likepage', :layout => false
  end
  
	
	
  def show
  	@category = Category.find(params[:id])
		@exercises = @category.exercises
		@name = @category.name
		@showDesc = true
		respond_to do |format|
			format.html
			format.js
		end
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
