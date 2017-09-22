class RenameQuotefavorite < ActiveRecord::Migration[5.1]
  def change
    rename_table :quotefavorites, :quote_favorites
  end
end
