class ChangeDescriptionFieldToText < ActiveRecord::Migration
  def change
    change_column :regions, :description, :text
  end
end
