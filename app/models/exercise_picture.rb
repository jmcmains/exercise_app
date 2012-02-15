class ExercisePicture < ActiveRecord::Base
	attr_accessible :picture
  belongs_to :exercise
  
  validates :exercise_id, :presence => true
end
