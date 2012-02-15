class Category < ActiveRecord::Base

	
	attr_accessible :name
	has_many :category_exercises, :foreign_key => "category_id",
                                   			 :class_name => "ExerciseCategory",
                                   			 :dependent => :destroy
  has_many :exercises, :through => :category_exercises
  
 	has_many :category_pictures, :foreign_key => "category_id",
                           		 :dependent => :destroy
                           		 
	
  def included_exercise?(exercise)
    category_exercises.find_by_exercise_id(exercise)
  end

  def include_exercise!(exercise)
    category_exercises.create!(:exercise_id => exercise.id)
  end
  
  def include_exercise_id!(exercise_id)
    category_exercises.create!(:exercise_id => exercise_id)
  end
  
	def exclude_exercise!(exercise)
    category_exercises.find_by_exercise_id(exercise).destroy
  end
  
  def width
  	(category_pictures.count-1)*200
  end
end
