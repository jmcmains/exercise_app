class GeneralTip < ActiveRecord::Base
	include Tanker
  after_save :update_tank_indexes
  after_destroy :delete_tank_indexes
  tankit 'ExerciseApp' do
    indexes :name
		indexes :content
  end
end
