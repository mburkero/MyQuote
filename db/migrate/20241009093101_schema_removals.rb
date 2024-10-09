# removing any unneccessary columns references and constraints from the database
class SchemaRemovals < ActiveRecord::Migration[7.0]
  def change
    #removing columns
    remove_column :users, :passwordSalt, :string
    remove_column :quotes, :dateOfAddition, :datetime

  end
end
