class AddAncestryDepthToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :ancestry_depth, :integer, default: 0
  end
end
