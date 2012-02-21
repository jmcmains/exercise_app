class Glossary < ActiveRecord::Base
	has_many :glossary_pictures, :foreign_key => "glossary_id",
                           		 :dependent => :destroy
  include Tanker
  after_save :update_tank_indexes
  after_destroy :delete_tank_indexes
  tankit 'ExerciseApp' do
    indexes :term
		indexes :description
  end
end
