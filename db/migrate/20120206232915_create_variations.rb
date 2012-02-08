class CreateVariations < ActiveRecord::Migration
  def change
    create_table :variations do |t|
      t.integer :exercise_id
      t.text :content

      t.timestamps
    end
  end
end
