class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :categoryName, null:false

      t.timestamps
    end
    add_index :categories, :categoryName, unique: true
  end
end
