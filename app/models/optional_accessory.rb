class OptionalAccessory < ActiveRecord::Base
	attr_accessible :name
	has_many :accessory_exercises, :foreign_key => "accessory_id",
                                   			 :class_name => "ExerciseAccessory",
                                   			 :dependent => :destroy
  has_many :exercises, :through => :accessory_exercises
	
  def included_exercise?(exercise)
    accessory_exercises.find_by_exercise_id(exercise)
  end

  def include_exercise!(exercise)
    accessory_exercises.create!(:exercise_id => exercise.id)
  end
  
  def include_exercise_id!(exercise_id)
    accessory_exercises.create!(:exercise_id => exercise_id)
  end
  
	def exclude_exercise!(exercise)
    accessory_exercises.find_by_exercise_id(exercise).destroy
  end
end
