class RemoveTimestamp < ActiveRecord::Migration[5.1]
  def change
    remove_column :quotes, :created_at, :updated_at
  end
end
