class CreateGlossaryPictures < ActiveRecord::Migration
  def change
    create_table :glossary_pictures do |t|
      t.integer :glossary_id
      t.string :picture

      t.timestamps
    end
  end
end
