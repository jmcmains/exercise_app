class CreateExerciseCategories < ActiveRecord::Migration
  def change
    create_table :exercise_categories do |t|
      t.integer :exercise_id
      t.integer :category_id


      t.timestamps
    end
    add_index :exercise_categories, :exercise_id
    add_index :exercise_categories, :category_id

    add_index :exercise_categories, [:exercise_id, :category_id], :unique => true
  end
end
