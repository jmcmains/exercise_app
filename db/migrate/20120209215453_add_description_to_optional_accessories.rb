class AddDescriptionToOptionalAccessories < ActiveRecord::Migration
  def change
    add_column :optional_accessories, :description, :text
		add_column :optional_accessories, :picture, :string
		add_column :optional_accessories, :store_link, :string
  end
end
