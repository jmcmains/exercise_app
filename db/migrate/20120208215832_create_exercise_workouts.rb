class CreateExerciseWorkouts < ActiveRecord::Migration
  def change
    create_table :exercise_workouts do |t|
      t.integer :exercise_id
      t.integer :workout_id

      t.timestamps
    end
    add_index :exercise_workouts, :exercise_id
    add_index :exercise_workouts, :workout_id
  end
end
