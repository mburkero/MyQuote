class ReferenceRemoval < ActiveRecord::Migration[7.0]
  def change
    # removing reference between authors and user
    remove_reference :authors, :user, null:false, foreign_key:true
  end
end
