class NullConstraints < ActiveRecord::Migration[7.0]
  def change
    #changing nulls on authors
    change_column_null(:authors, :authByear, true)
    change_column_null(:authors, :authDyear, true)
    change_column_null(:authors, :biography, true)
    change_column_null(:authors, :authName, false)

    #changing null on categories
    change_column_null(:categories, :categoryName, false)
    
    #changing nulls on quotes
    change_column_null(:quotes, :yearOfPublication, null:true)
    change_column_null(:quotes, :comment, null:true)
  end
end