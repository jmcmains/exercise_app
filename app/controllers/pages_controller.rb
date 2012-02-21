class PagesController < ApplicationController
  def home
  	@title = "Rubberbanditz Exercise Application"
  	render :layout => false
  end

  def help
  end

  def contact
  end
end
