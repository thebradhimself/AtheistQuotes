class RemoveTimestamp < ActiveRecord::Migration
  def change
    remove_column :quotes, :created_at, :updated_at
  end
end
