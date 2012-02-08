class CreateExerciseAccessories < ActiveRecord::Migration
  def change
    create_table :exercise_accessories do |t|
      t.integer :exercise_id
      t.integer :accessory_id

      t.timestamps
    end
    add_index :exercise_accessories, :exercise_id
    add_index :exercise_accessories, :accessory_id

    add_index :exercise_accessories, [:exercise_id, :accessory_id], :unique => true
  end
end
