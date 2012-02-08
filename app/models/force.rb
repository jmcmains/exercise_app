class Force < ActiveRecord::Base
	attr_accessible :name
	has_many :force_exercises, :foreign_key => "accessory_id",
                                   			 :class_name => "ExerciseForce",
                                   			 :dependent => :destroy
  has_many :exercises, :through => :force_exercises
	
  def included_exercise?(exercise)
    force_exercises.find_by_exercise_id(exercise)
  end

  def include_exercise!(exercise)
    force_exercises.create!(:exercise_id => exercise.id)
  end
  
  def include_exercise_id!(exercise_id)
    force_exercises.create!(:exercise_id => exercise_id)
  end
  
	def exclude_exercise!(exercise)
    force_exercises.find_by_exercise_id(exercise).destroy
  end
end
