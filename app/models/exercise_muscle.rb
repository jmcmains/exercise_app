class ExerciseMuscle < ActiveRecord::Base
	attr_accessible :exercise_id, :muscle_id
	
	belongs_to :exercise, :class_name => "Exercise"
  belongs_to :muscle, :class_name => "TargetMuscle"
  
  validates :exercise_id, :presence => true
  validates :muscle_id, :presence => true
end
