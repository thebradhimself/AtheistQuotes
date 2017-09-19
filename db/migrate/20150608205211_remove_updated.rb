class RemoveUpdated < ActiveRecord::Migration[5.1]
  def change
    remove_column :quotes, :updated_at
  end
end
