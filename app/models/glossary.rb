class Glossary < ActiveRecord::Base
	has_many :glossary_pictures, :foreign_key => "glossary_id",
                           		 :dependent => :destroy
  
end
