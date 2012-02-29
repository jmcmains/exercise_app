class ExerciseWorkout < ActiveRecord::Base
	attr_accessible :exercise_id, :workout_id
	
	belongs_to :exercise, :class_name => "Exercise"
  belongs_to :workout, :class_name => "Workout"
  
  validates :exercise_id, :presence => true
  validates :workout_id, :presence => true
  default_scope order: 'exercise_workouts.id ASC'
end
