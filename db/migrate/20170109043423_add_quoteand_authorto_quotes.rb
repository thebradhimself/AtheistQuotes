class AddQuoteandAuthortoQuotes < ActiveRecord::Migration[5.1]
  def change
    add_column :quotes, :quote, :string
    add_column :quotes, :author, :string
  end
end
