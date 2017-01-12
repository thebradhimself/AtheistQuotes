class AddQuoteandAuthortoQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :quote, :string
    add_column :quotes, :author, :string
  end
end
