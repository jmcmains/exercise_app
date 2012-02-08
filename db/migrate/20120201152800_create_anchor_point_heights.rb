class CreateAnchorPointHeights < ActiveRecord::Migration
  def change
    create_table :anchor_point_heights do |t|
      t.string :name

      t.timestamps
    end
  end
end
