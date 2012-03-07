class Variation < ActiveRecord::Base
  belongs_to :exercise
  validates_presence_of :content
end
