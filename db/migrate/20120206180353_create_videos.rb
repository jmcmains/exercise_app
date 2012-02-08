class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :exercise_id
      t.string :location

      t.timestamps
    end
    
  end
end
