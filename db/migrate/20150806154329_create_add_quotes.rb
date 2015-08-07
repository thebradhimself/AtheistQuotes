class CreateAddQuotes < ActiveRecord::Migration
  def change
    create_table :add_quotes do |t|
      t.string :quote, null: false
      t.string :author, null: false
      t.timestamps null: false
    end
  end
end
