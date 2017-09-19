class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.string :the_quote
      t.timestamps null: false
    end
  end
end
