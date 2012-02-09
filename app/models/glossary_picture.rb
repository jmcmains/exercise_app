class GlossaryPicture < ActiveRecord::Base
  attr_accessible :picture
  belongs_to :glossary
  
  validates :glossary_id, :presence => true
  
end
