class CreateForces < ActiveRecord::Migration
  def change
    create_table :forces do |t|
      t.string :name

      t.timestamps
    end
  end
end
