class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :sets
      t.string :reps
      t.string :per_week
      t.string :duration
      t.string :tempo

      t.timestamps
    end
  end
end
