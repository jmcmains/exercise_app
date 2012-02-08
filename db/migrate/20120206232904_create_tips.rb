class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.integer :exercise_id
      t.text :content

      t.timestamps
    end
  end
end
