class Tip < ActiveRecord::Base
	attr_accessible :content
  belongs_to :exercise
  
  validates :exercise_id, :presence => true
end
