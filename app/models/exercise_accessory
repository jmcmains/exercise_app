class ExerciseAccessory < ActiveRecord::Base
	attr_accessible :exercise_id, :accessory_id
	
	belongs_to :exercise, :class_name => "Exercise"
  belongs_to :accessory, :class_name => "OptionalAccessory"
  
  validates :exercise_id, :presence => true
  validates :accessory_id, :presence => true
end
