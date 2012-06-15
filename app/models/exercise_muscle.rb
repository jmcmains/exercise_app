class ExerciseMuscle < ActiveRecord::Base

	
	belongs_to :exercise, :class_name => "Exercise"
  belongs_to :muscle, :class_name => "TargetMuscle"

end
