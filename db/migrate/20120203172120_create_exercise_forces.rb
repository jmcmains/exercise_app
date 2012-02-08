class CreateExerciseForces < ActiveRecord::Migration
  def change
    create_table :exercise_forces do |t|
      t.integer :exercise_id
      t.integer :force_id

      t.timestamps
    end
    add_index :exercise_forces, :exercise_id
    add_index :exercise_forces, :force_id

    add_index :exercise_forces, [:exercise_id, :force_id], :unique => true
  end
end
