class Position < ActiveRecord::Base
	attr_accessible :name
	has_many :position_exercises, :foreign_key => "category_id",
                                   			 :class_name => "ExercisePosition",
                                   			 :dependent => :destroy
  has_many :exercises, :through => :position_exercises
	
  def included_exercise?(exercise)
    position_exercises.find_by_exercise_id(exercise)
  end

  def include_exercise!(exercise)
    position_exercises.create!(:exercise_id => exercise.id)
  end
  
  def include_exercise_id!(exercise_id)
    position_exercises.create!(:exercise_id => exercise_id)
  end
  
	def exclude_exercise!(exercise)
    position_exercises.find_by_exercise_id(exercise).destroy
  end
end
