class CreateCategoryPictures < ActiveRecord::Migration
  def change
    create_table :category_pictures do |t|
      t.integer :category_id
      t.string :picture

      t.timestamps
    end
    
    add_index :category_pictures, :category_id
  end
end
