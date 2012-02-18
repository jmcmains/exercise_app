class GeneralTipsController < ApplicationController
	def expand
  	@general_tip = GeneralTip.find(params[:id])
  	respond_to do |format|
			format.js
		end
  end
  
   def collapse
		@general_tip = GeneralTip.find(params[:id])
  	respond_to do |format|
			format.js
		end
  end
end
