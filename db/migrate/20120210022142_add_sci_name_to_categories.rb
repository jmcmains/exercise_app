class AddSciNameToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :sci_name, :string
    add_column :categories, :description, :text
  end
end
