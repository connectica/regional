class AddAncestryToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :ancestry, :string
    add_index :regions, :ancestry
  end
end
