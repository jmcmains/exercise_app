class CreateExerciseMuscles < ActiveRecord::Migration
  def change
    create_table :exercise_muscles do |t|
      t.integer :exercise_id
      t.integer :muscle_id
      t.boolean :primary, :default => false

      t.timestamps
    end
    add_index :exercise_muscles, :exercise_id
    add_index :exercise_muscles, :muscle_id

    add_index :exercise_muscles, [:exercise_id, :muscle_id], :unique => true
  end
end
