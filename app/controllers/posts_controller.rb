class PostsController < ApplicationController
  
  def index
    @title = "All Posts"
    @posts = Post.all
  end
  
  def show
  	@post = Post.find(params[:id])
  end
  
  def edit
  	@post = Post.find(params[:id])
  	@title = "Edit Post"
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Profile updated."
    	redirect_to posts_path
    else
      @title = "Edit Post"
      render 'edit'
    end
  end

	def destroy
		Post.find(params[:id]).destroy
    flash[:success] = "Category destroyed."
    redirect_to posts_path
  end
  
  def new
  	@post = Post.new
  	@title = "New Category"
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to post_path
    else
      @title = "Sign up"
      render 'new'
    end
  end
end
