class ExerciseCategory < ActiveRecord::Base
	attr_accessible :exercise_id, :category_id
	
	belongs_to :exercise, :class_name => "Exercise"
  belongs_to :category, :class_name => "Category"
  
  validates :exercise_id, :presence => true
  validates :category_id, :presence => true
end
