class CategoriesController < ApplicationController
  
  def index
    @title = "All Categories"
    @sel="All"
    @clickex=false
    @clickcat=true
    @results=Category.all
  end
  
  def search
		ex = Exercise.search do
		  keywords params[:query]
		end
		exercises=ex.results
		gl = Glossary.search do
		  keywords params[:query]
		end
		glossary=gl.results
		glossary.each do |g|
			exercises << g
		end
		@results = exercises
		@clickex=false
    @clickcat=false
		respond_to do |format|
		  format.html { render :action => "index" }
		  format.xml  { render :xml => @results }
		  format.js
		end
	end
  
  def show
  	@title = "All Categories"
  	@sel=Category.find(params[:id]).name
  	@results=Category.all
  	@clickex=false
  	@clickcat=true
  	render 'index'
  	respond_to do |format|
  		format.html { render :action => "index" }
		  format.xml  { render :xml => @results }
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
