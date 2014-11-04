class RemoveParentId < ActiveRecord::Migration
  def change
    remove_column :regions, :parent_id
    remove_column :regions, :type
  end
end
