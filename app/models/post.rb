class Post < ActiveRecord::Base
	attr_accessible :name
	has_many :post_exercises, :foreign_key => "accessory_id",
                                   			 :class_name => "ExerciseForce",
                                   			 :dependent => :destroy
  has_many :exercises, :through => :post_exercises
	
  def included_exercise?(exercise)
    post_exercises.find_by_exercise_id(exercise)
  end

  def include_exercise!(exercise)
    post_exercises.create!(:exercise_id => exercise.id)
  end
  
  def include_exercise_id!(exercise_id)
    post_exercises.create!(:exercise_id => exercise_id)
  end
  
	def exclude_exercise!(exercise)
    post_exercises.find_by_exercise_id(exercise).destroy
  end
end
