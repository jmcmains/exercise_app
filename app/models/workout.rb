class Workout < ActiveRecord::Base
	attr_accessible :name
	has_many :workout_exercises, :foreign_key => "workout_id",
                                   			 :class_name => "ExerciseWorkout",
                                   			 :dependent => :destroy
  has_many :exercises, :through => :workout_exercises
	default_scope order: 'workouts.id DESC'
	
  def included_exercise?(exercise)
    workout_exercises.find_by_exercise_id(exercise)
  end

  def include_exercise!(exercise)
    workout_exercises.create!(:exercise_id => exercise.id)
  end
  
  def include_exercise_id!(exercise_id)
    workout_exercises.create!(:exercise_id => exercise_id)
  end
  
	def exclude_exercise!(exercise)
    workout_exercises.find_by_exercise_id(exercise).destroy
  end
end
