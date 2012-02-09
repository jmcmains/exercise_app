class CreateGeneralTips < ActiveRecord::Migration
  def change
    create_table :general_tips do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
