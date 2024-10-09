class RemoveAuthLnameFromAuthors < ActiveRecord::Migration[7.0]
  def change
    #altering :authors to combine author first and last name into one field
    remove_column :authors, :authLname, :string
    remove_column :authors, :authFname, :string
    add_column :authors, :authName, :string, null:true
  end
end
