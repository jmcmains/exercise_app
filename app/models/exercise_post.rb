class ExercisePost < ActiveRecord::Base
	attr_accessible :exercise_id, :post_id
	
	belongs_to :exercise, :class_name => "Exercise"
  belongs_to :post, :class_name => "Post"
  
  validates :exercise_id, :presence => true
  validates :post_id, :presence => true
end
