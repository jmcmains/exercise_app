class CreateExercisePositions < ActiveRecord::Migration
  def change
    create_table :exercise_positions do |t|
      t.integer :exercise_id
      t.integer :position_id

      t.timestamps
    end
    add_index :exercise_positions, :exercise_id
    add_index :exercise_positions, :position_id

    add_index :exercise_positions, [:exercise_id, :position_id], :unique => true
  end
end
