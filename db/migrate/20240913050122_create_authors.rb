class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :authFname, null:false
      t.string :authLname, null:false
      t.string :authByear, null:false
      t.string :authDyear
      t.text :biography
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
