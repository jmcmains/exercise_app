class VideosController < ApplicationController
  
  def index
    @title = "All Videos"
    @videos = Video.all
  end
  
  def display
		@video = Video.find(params[:id])
  	respond_to do |format|
			format.js
		end
	end
    
  def show
  	@video = Video.find(params[:id])
  end
  
  def edit
  	@video = Video.find(params[:id])
  	@title = "Edit Video"
  end
  
  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(params[:video])
      flash[:success] = "Profile updated."
    	redirect_to videos_path
    else
      @title = "Edit Video"
      render 'edit'
    end
  end

	def destroy
		Video.find(params[:id]).destroy
    flash[:success] = "Video destroyed."
    redirect_to videos_path
  end
  
  def new
  	@video = Video.new
  	@title = "New Video"
  end
  
  def create
    @video = Video.new(params[:video])
    if @video.save
      redirect_to videos_path
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  
end
