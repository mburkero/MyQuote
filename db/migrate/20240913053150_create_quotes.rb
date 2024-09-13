class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.text :quoteText, null:false
      t.datetime :dateOfAddition, null:false
      t.string :yearOfPublication
      t.text :comment
      t.boolean :isQuotePublic, default:true
      t.references :user, null: false, foreign_key: true
      t.references :quote, null: false, foreign_key: true

      t.timestamps
    end
  end
end
