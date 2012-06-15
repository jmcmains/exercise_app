class ExercisePosition < ActiveRecord::Base
	attr_accessible :exercise_id, :position_id
	
	belongs_to :exercise, :class_name => "Exercise"
  belongs_to :position, :class_name => "Position"
end
