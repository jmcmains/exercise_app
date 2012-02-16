class CategoryPicture < ActiveRecord::Base
	attr_accessible :category_id, :picture
	
  belongs_to :category, :class_name => "Category"
  
  validates :category_id, :presence => true
  
  def get_site
  	"https://s3.amazonaws.com/ExerciseApp/images/" + self.picture
  end
end
