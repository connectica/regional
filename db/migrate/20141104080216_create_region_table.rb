class CreateRegionTable < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.string :description
      t.integer :parent_id
      t.string :type

      t.timestamps
    end
  end
end
