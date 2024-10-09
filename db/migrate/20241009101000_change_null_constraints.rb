class ChangeNullConstraints < ActiveRecord::Migration[7.0]
  def change
    #changing nulls on authors
    change_column :authors, :authByear, null:true
    change_column :authors, :authDyear, null:true
    change_column :authors, :biography, null:true
    change_column :authors, :authName, null:false

    #changing null on categories
    change_column :categories, :categoryName, null:false
    
    #changing nulls on quotes
    change_column :quotes, :yearOfPublication, null:true
    change_column :quotes, :comment, null:true


  end
end
