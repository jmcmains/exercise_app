class Video < ActiveRecord::Base
	attr_accessible :location
  belongs_to :exercise
  
  validates :exercise_id, :presence => true
  
  def get_image
  	"http://img.youtube.com/vi/" + self.location + "/default.jpg"
  end
  
  def get_embed
  	"http://www.youtube.com/embed/" + self.location
  end
end
