class ExerciseHeight < ActiveRecord::Base
	attr_accessible :exercise_id, :height_id
	
	belongs_to :exercise, :class_name => "Exercise"
  belongs_to :height, :class_name => "AnchorPointHeight"

end
