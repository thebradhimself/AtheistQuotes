class RemoveUpdated < ActiveRecord::Migration
  def change
    remove_column :quotes, :updated_at
  end
end
