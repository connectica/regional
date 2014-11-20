class AddNamesDepthCache < ActiveRecord::Migration
  def change
    add_column :regions, :names_depth_cache, :string
  end
end
