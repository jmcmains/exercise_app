class CreateExercisePictures < ActiveRecord::Migration
  def change
    create_table :exercise_pictures do |t|
      t.integer :exercise_id
      t.string :picture

      t.timestamps
    end
    
    add_index :exercise_pictures, :exercise_id
  end
end
