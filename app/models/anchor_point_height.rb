class AnchorPointHeight < ActiveRecord::Base
	attr_accessible :name
	has_many :height_exercises, :foreign_key => "height_id",
                                   			 :class_name => "ExerciseHeight",
                                   			 :dependent => :destroy
  has_many :exercises, :through => :height_exercises
	
  def included_exercise?(exercise)
    height_exercises.find_by_exercise_id(exercise)
  end

  def include_exercise!(exercise)
    height_exercises.create!(:exercise_id => exercise.id)
  end
  
  def include_exercise_id!(exercise_id)
    height_exercises.create!(:exercise_id => exercise_id)
  end
  
	def exclude_exercise!(exercise)
    height_exercises.find_by_exercise_id(exercise).destroy
  end
end
