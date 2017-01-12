class NewQuoteStructure < ActiveRecord::Migration
  def change
    add_column :quotes, :quotes, :string
  end
end
