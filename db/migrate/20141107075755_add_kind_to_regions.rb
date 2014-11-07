class AddKindToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :kind, :string
  end
end
