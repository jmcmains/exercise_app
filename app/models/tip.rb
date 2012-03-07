class Tip < ActiveRecord::Base
  belongs_to :exercise
  validates_presence_of :content
end	
