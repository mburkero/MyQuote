class QuoteChanges < ActiveRecord::Migration[7.0]
  def change
    remove_reference :quotes, :quote, null:false, foreign_key:true
    add_reference :quotes, :author, null:false, foreign_key:true
  end
end
