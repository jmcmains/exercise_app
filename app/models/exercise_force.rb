class ExerciseForce < ActiveRecord::Base
	attr_accessible :exercise_id, :force_id
	
	belongs_to :exercise, :class_name => "Exercise"
  belongs_to :force, :class_name => "Force"
  
  validates :exercise_id, :presence => true
  validates :force_id, :presence => true
end
