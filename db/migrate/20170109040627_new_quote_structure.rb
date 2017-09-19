class NewQuoteStructure < ActiveRecord::Migration[5.1]
  def change
    add_column :quotes, :quotes, :string
  end
end
