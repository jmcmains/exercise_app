class CreateOptionalAccessories < ActiveRecord::Migration
  def change
    create_table :optional_accessories do |t|
      t.string :name

      t.timestamps
    end
  end
end
