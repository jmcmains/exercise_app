class AddPrimaryToExerciseAccessories < ActiveRecord::Migration
  def change
    add_column :exercise_accessories, :primary, :boolean, :default => false
  end
end
