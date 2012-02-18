class ExercisePicturesController < ApplicationController
	def display
		@exercise_picture = ExercisePicture.find(params[:id])
  	respond_to do |format|
			format.js
		end
	end
end
