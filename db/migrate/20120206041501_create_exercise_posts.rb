class CreateExercisePosts < ActiveRecord::Migration
  def change
    create_table :exercise_posts do |t|
      t.integer :exercise_id
      t.integer :post_id

      t.timestamps
    end
    add_index :exercise_posts, :exercise_id
    add_index :exercise_posts, :post_id

    add_index :exercise_posts, [:exercise_id, :post_id], :unique => true
  end
end
