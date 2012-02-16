class GlossaryPicture < ActiveRecord::Base
  attr_accessible :picture
  belongs_to :glossary
  
  validates :glossary_id, :presence => true
  
  def get_site
  	"https://s3.amazonaws.com/ExerciseApp/images/" + self.picture
  end
end
