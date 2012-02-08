class Video < ActiveRecord::Base
	attr_accessible :location
  belongs_to :exercise
  
  validates :exercise_id, :presence => true
  
  def get_number(video)
  	video.location[video.location.index("=")+1..-1]
  end
end
