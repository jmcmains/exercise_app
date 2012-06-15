class AddDisplayToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :display, :boolean, default: true

  end
end
