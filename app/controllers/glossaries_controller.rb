class GlossariesController < ApplicationController
	def expand
  	@glossary = Glossary.find(params[:id])
  	respond_to do |format|
			format.js
		end
  end
  
   def collapse
  	@glossary = Glossary.find(params[:id])
  	respond_to do |format|
			format.js
		end
  end
  
  def show
  	@glossary = Glossary.find(params[:id])
  end
  
  def index
  	@title = "Glossary | Rubberbanditz Exercise Library"
  end
end
