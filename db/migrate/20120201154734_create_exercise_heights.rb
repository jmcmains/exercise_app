class CreateExerciseHeights < ActiveRecord::Migration
  def change
    create_table :exercise_heights do |t|
      t.integer :exercise_id
      t.integer :height_id

      t.timestamps
    end
    add_index :exercise_heights, :exercise_id
    add_index :exercise_heights, :height_id

    add_index :exercise_heights, [:exercise_id, :height_id], :unique => true
  end
end
