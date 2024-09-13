class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :fname, null:false
      t.string :lname, null:false
      t.string :email, null:false
      t.string :password_digest, null:false
      t.string :passwordSalt, null:false
      t.boolean :isAdmin, null:false
      t.string :status, null:false

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
