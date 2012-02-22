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
  
	def search
		api_client = IndexTank::Client.new 'http://:ugQl2q6LHYQ5BQ@d7rbf.api.searchify.com'
		exerciseApp = api_client.indexes 'ExerciseApp'
		q1=params[:query].split
		q2 = []
		q1.each do |q|
			q2 << q + "*" << " OR "
		end
		q3=q2[0..-2].join
		query="__any:(#{q3})"
		@results= exerciseApp.search(query, :fetch => '__id,__type,name,term',:len => 200,:snippet => "__any")
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
