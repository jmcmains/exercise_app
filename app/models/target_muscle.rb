class TargetMuscle < ActiveRecord::Base
	attr_accessible :name
	has_many :muscle_exercises, :foreign_key => "muscle_id",
                                   			 :class_name => "ExerciseMuscle",
                                   			 :dependent => :destroy
  has_many :exercises, :through => :muscle_exercises
	
  def included_exercise?(exercise)
    muscle_exercises.find_by_exercise_id(exercise)
  end

  def include_exercise!(exercise)
    muscle_exercises.create!(:exercise_id => exercise.id)
  end
  
  def include_exercise_id!(exercise_id)
    muscle_exercises.create!(:exercise_id => exercise_id)
  end
  
	def exclude_exercise!(exercise)
    muscle_exercises.find_by_exercise_id(exercise).destroy
  end
  end
